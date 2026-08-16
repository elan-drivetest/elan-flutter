import 'package:elan/core/validatator/canadian_phone.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('digitsOf', () {
    test('strips mask punctuation', () {
      expect(CanadianPhone.digitsOf('(416) 555-0134'), '4165550134');
    });

    test('drops a leading country code', () {
      expect(CanadianPhone.digitsOf('+1 416 555 0134'), '4165550134');
      expect(CanadianPhone.digitsOf('14165550134'), '4165550134');
    });

    test('leaves a bare 10-digit number alone', () {
      expect(CanadianPhone.digitsOf('4165550134'), '4165550134');
    });
  });

  group('validate — accepts real Canadian numbers', () {
    const valid = {
      'Toronto': '4165550134',
      'Vancouver': '6045550188',
      'Montreal': '5145550143',
      'Calgary': '4035550190',
      'Winnipeg': '2045550175',
      'Halifax': '9025550122',
      'Territories': '8675550111',
      'recent overlay (753 Ottawa)': '7535550166',
    };
    valid.forEach((label, number) {
      test(label, () => expect(CanadianPhone.validate(number), isNull));
    });

    test('accepts an already-masked value', () {
      expect(CanadianPhone.validate('(416) 555-0134'), isNull);
    });
  });

  group('validate — rejects US numbers sharing +1', () {
    // The whole reason the area-code list exists: locking the picker to Canada
    // cannot distinguish these, because Canada and the US share country code 1.
    const us = {
      'New York 212': '2125550100',
      'Los Angeles 310': '3105550100',
      'Chicago 312': '3125550100',
      'Seattle 206': '2065550100',
    };
    us.forEach((label, number) {
      test(label, () {
        final msg = CanadianPhone.validate(number);
        expect(msg, isNotNull);
        expect(msg, contains('Canadian'));
      });
    });
  });

  group('validate — structural NANP rules', () {
    test('rejects too few digits', () {
      expect(CanadianPhone.validate('416555'), 'Enter all 10 digits');
    });

    test('rejects empty', () {
      expect(CanadianPhone.validate(''), 'Please enter a phone number');
      expect(CanadianPhone.validate(null), 'Please enter a phone number');
    });

    test('rejects an area code starting 0 or 1', () {
      expect(CanadianPhone.validate('0165550134'), contains('Area code'));
      expect(CanadianPhone.validate('1165550134'), contains('Area code'));
    });

    test('rejects an exchange starting 0 or 1', () {
      expect(CanadianPhone.validate('4160550134'),
          contains('after the area code'));
      expect(CanadianPhone.validate('4161550134'),
          contains('after the area code'));
    });

    test('rejects N99 service codes', () {
      expect(CanadianPhone.validate('4995550134'), contains('not in service'));
    });
  });

  group('toE164', () {
    test('produces the wire format the API expects', () {
      expect(CanadianPhone.toE164('(416) 555-0134'), '+14165550134');
      expect(CanadianPhone.toE164('4165550134'), '+14165550134');
    });

    test('returns null rather than a malformed number', () {
      expect(CanadianPhone.toE164('2125550100'), isNull); // US
      expect(CanadianPhone.toE164('416555'), isNull); // short
    });
  });

  group('format', () {
    test('builds the mask progressively as digits arrive', () {
      expect(CanadianPhone.format('4'), '4');
      expect(CanadianPhone.format('416'), '416');
      expect(CanadianPhone.format('4165'), '(416) 5');
      expect(CanadianPhone.format('416555'), '(416) 555');
      expect(CanadianPhone.format('4165550134'), '(416) 555-0134');
    });

    test('never renders more than 10 digits', () {
      expect(CanadianPhone.format('41655501349999'), '(416) 555-0134');
    });
  });

  group('stored-value round trip (profile edit sheet)', () {
    // The sheet seeds its field from the API's E.164 string and later compares
    // the edited value back against it. Both directions have to agree or the
    // sheet PATCHes on every open.
    const stored = '+14165550134';

    test('E.164 in, masked out', () {
      expect(
        CanadianPhone.format(CanadianPhone.digitsOf(stored)),
        '(416) 555-0134',
      );
    });

    test('masked value normalises back to the stored value', () {
      expect(CanadianPhone.toE164('(416) 555-0134'), stored);
    });

    test('untouched field reports no change', () {
      final displayed = CanadianPhone.format(CanadianPhone.digitsOf(stored));
      expect(CanadianPhone.toE164(displayed), CanadianPhone.toE164(stored));
    });

    test('a real edit is detected', () {
      expect(
        CanadianPhone.toE164('(604) 555-0188'),
        isNot(CanadianPhone.toE164(stored)),
      );
    });

    test('an empty stored value seeds an empty field', () {
      expect(CanadianPhone.format(CanadianPhone.digitsOf('')), '');
    });
  });

  group('area code list sanity', () {
    test('covers every province and territory', () {
      // One known code per region — a guard against an accidental deletion.
      for (final code in [
        '204',
        '236',
        '306',
        '403',
        '416',
        '506',
        '514',
        '709',
        '867',
        '902',
      ]) {
        expect(
          CanadianPhone.canadianAreaCodes,
          contains(code),
          reason: '$code should be a Canadian area code',
        );
      }
    });

    test('contains no US codes', () {
      for (final code in ['212', '310', '312', '206', '415', '702']) {
        expect(CanadianPhone.canadianAreaCodes, isNot(contains(code)));
      }
    });

    test('every entry is a structurally legal NPA', () {
      for (final code in CanadianPhone.canadianAreaCodes) {
        expect(code.length, 3, reason: code);
        expect('01'.contains(code[0]), isFalse, reason: '$code starts 0/1');
      }
    });
  });
}
