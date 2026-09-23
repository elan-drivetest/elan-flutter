# Privacy Policy for Elan Road Test Rental

**Last Updated:** September 23, 2026  
**Effective Date:** September 23, 2026  

---

## 1. Introduction & Overview

Welcome to **Elan Road Test Rental** ("**Elan**," "**we**," "**us**," or "**our**"). Elan is a Canadian owned and operated transportation and driver preparation technology platform headquartered in Toronto, Ontario, Canada (M5V 2H1). We connect Ontario learner drivers preparing for their G2 and G road tests with certified, professional driving instructors and fully insured, dual-brake equipped, road-test-ready vehicles.

This Privacy Policy explains how we collect, use, disclose, retain, and safeguard your personal information when you access or use:
1. The **Elan Road Test Rental Mobile Applications** (including the **Elan: Road Test Car Rental** customer app and the **Elan Instructor** mobile app, package identifier `com.drivingschool.elan`, available on the Apple App Store and Google Play Store);
2. Our official website located at [https://www.elanroadtestrental.ca](https://www.elanroadtestrental.ca) (and associated subdomains); and
3. Any related online services, customer support channels, booking portals, and dispatch systems (collectively, the "**Services**").

Please read this Privacy Policy carefully. By downloading, accessing, or using our Services, you consent to the collection, use, and disclosure of your personal information in accordance with this Privacy Policy. If you do not agree with any part of this Policy, you must discontinue use of our mobile applications and services immediately.

---

## 2. Regulatory Compliance & Government Non-Affiliation Disclaimer

### 2.1 Statutory Legal Framework (Canada & Ontario)
Elan complies with Canadian privacy legislation, including the federal **Personal Information Protection and Electronic Documents Act (PIPEDA)**, the ten fair information principles set out in Schedule 1 of PIPEDA, and applicable provincial privacy standards in Ontario.

### 2.2 Strict Non-Affiliation Disclaimer
> **IMPORTANT NOTICE:**  
> **Elan Road Test Rental is an independent commercial platform. Elan is NOT affiliated with, sponsored by, authorized by, or endorsed by DriveTest Ontario, Serco DES Inc., the Ministry of Transportation of Ontario (MTO), or the Government of Ontario.**  
> Any reference to "DriveTest", "G1", "G2", or "G" is solely for descriptive purposes to identify test locations, test categories, and customer vehicle rental requirements.

---

## 3. Scope & User Roles

This Privacy Policy applies to all individuals who interact with our platform, specifically:
- **Learner Drivers / Customers ("Learners"):** Individuals booking vehicles, instructors, pickup/drop-off services, mock driving tests, or lesson packages.
- **Driving Instructors ("Instructors"):** Independent, certified driving instructors operating via the Elan Instructor mobile application to accept rides, provide vehicles, guide students, track trips, and receive earnings.
- **Website Visitors:** Individuals browsing our public web pages or submitting inquiries.

---

## 4. Information We Collect

We collect information necessary to deliver, safeguard, coordinate, and administer our test car rental and driving instruction services.

### 4.1 Information Provided Directly by Learner Drivers (Customers)
* **Account & Contact Details:** Full name, email address, telephone number, residential/pickup address, and login credentials.
* **Licensing & Identity Verification Documents:** High-resolution digital photographs or scans of your Ontario G1 or G2 driver’s licence, along with date of birth and licence number, collected to confirm test eligibility and identity.
* **Test Booking Documents:** Official DriveTest road test appointment booking confirmations (appointment date, time, and DriveTest test centre location).
* **Payment Information:** Payment card details, billing address, and transaction identifiers. *Note: All credit/debit card processing is handled directly by PCI-DSS certified payment processors (Stripe, Klarna, and Afterpay). Elan does not store full credit card numbers or CVV codes on its servers.*
* **Communications & Feedback:** Support inquiries, rating submissions, survey responses, and correspondence with our support team.

### 4.2 Information Provided Directly by Driving Instructors
* **Identity & Contact Details:** Full legal name, email address, mobile phone number, physical address, and profile photo.
* **Professional Credentials & Certifications:** Ontario Driving Instructor licence, standard driver’s licence, licence validity dates, and driving school affiliation name.
* **Employment & Tax Eligibility Documents:** Proof of Canadian work eligibility (e.g., Canadian citizenship, PR card, or work permit) and tax documentation (Social Insurance Number / Business Number / HST registration details where applicable for T4A/contractor filing).
* **Vehicle Documentation & Verification:** Vehicle make, model, year, exterior colour, licence plate number, official vehicle registration certificate, commercial vehicle insurance policy showing dual-brake coverage, and photographs of the vehicle.
* **Banking & Payout Details:** Bank routing and transit numbers, account details, and identity verification documents submitted securely via **Stripe Connect** to enable automated payout transfers.

### 4.3 Information Collected Automatically During App Usage
* **High-Precision Geolocation Data (Instructors & Active Rides):**
  * When an Instructor begins an active ride session, the Elan Instructor app collects precise GPS latitude, longitude, heading/bearing, speed, altitude, accuracy, and capture timestamps using a dedicated foreground service (`FOREGROUND_SERVICE_LOCATION` on Android; Background Location Mode on iOS).
  * This telemetry is gathered every 10 seconds or 50 meters of displacement solely during an active test or pickup journey.
  * **Purpose:** To calculate exact travel distance, verify arrival at the scheduled DriveTest centre, determine accurate route-based instructor compensation, and ensure participant safety.
  * **Customer Geolocation:** For Learner Drivers, location data is collected only while actively selecting pickup coordinates or viewing nearby test centers. Customer background location is never accessed.
* **Device & Technical Telemetry:**
  * Device hardware model, operating system brand and version, unique device identifiers, application version, battery level, network connection status (Wi-Fi/Cellular), and device timezone.
* **Session & Local Storage Data:**
  * Authentication session cookies managed via encrypted, persistent on-disk storage (`PersistCookieJar`).
  * Sensitive session tokens and encryption keys stored securely in the device's hardware-backed key store using `flutter_secure_storage` (iOS Keychain / Android Keystore).
* **Diagnostic & Crash Information:**
  * Crash logs, API network response metrics, error codes, and performance data collected to maintain app reliability.

---

## 5. How We Use Your Information

We process personal information under the following legal bases and operational purposes:

1. **Service Delivery & Fulfillment:**
   * Facilitating vehicle rentals, scheduling 45-minute pre-test vehicle familiarizations, and coordinating pickup/drop-off logistics.
   * Matching Learner Drivers with nearby certified Driving Instructors.
   * Calculating accurate travel duration, distance, and fair instructor compensation.
2. **Identity, Eligibility & Safety Verification:**
   * Verifying that Learner Drivers hold valid Ontario driving privileges (e.g., G1 licence) and valid DriveTest road test appointments before dispatching a vehicle.
   * Vetting Instructor qualifications, criminal record declarations, commercial insurance validity, dual-brake vehicle safety, and legal entitlement to work in Canada.
3. **Payment & Payout Processing:**
   * Collecting service fees from Learners via Stripe, Klarna, or Afterpay.
   * Calculating and transferring remuneration and referral bonuses to Instructors through Stripe Connect.
4. **Safety, Fraud Prevention & Legal Compliance:**
   * Preventing unauthorized vehicle operation, identity fraud, and booking duplication.
   * Complying with Canadian federal and Ontario provincial statutory requirements, tax reporting (CRA), and accounting audits.
5. **Customer Communications & Support:**
   * Transmitting transactional push notifications, SMS booking updates, schedule changes, and arrival alerts.
   * Resolving customer support requests and investigating trip discrepancies.

---

## 6. Disclosure & Sharing of Personal Information

We do not sell, rent, or trade personal information to third parties. We share information strictly as described below:

### 6.1 Between Learner Drivers and Assigned Instructors
To facilitate the in-person driving test service, the assigned Instructor receives:
- Learner's full name, phone number, and agreed pickup or meeting location;
- Verification that the Learner holds a confirmed DriveTest appointment and G1 licence;
- The target DriveTest centre and test type (G2 or G).
Instructors are strictly bound by confidentiality terms and are prohibited from using Learner personal data for any purpose outside the assigned booking.

### 6.2 Authorized Third-Party Service Providers (Sub-Processors)
We engage trusted third-party service providers who process data on our behalf under strict data protection agreements:
* **Cloud Infrastructure & Storage:** Amazon Web Services (AWS) — Encrypted hosting and document storage (S3) within secure North American data centers.
* **Payment Gateways & Financing:**
  * **Stripe & Stripe Connect:** Card tokenization, checkout processing, fraud monitoring, and automated direct payouts to Instructors.
  * **Klarna & Afterpay:** Installment payment processing ("Pay Later") for eligible Learner bookings.
* **Mapping, Routing & Geocoding:** Google Maps Platform (Google Maps SDK, Directions API, Places API) — Address autocomplete, route calculation, and map display.
* **Push Notification Services:** Firebase Cloud Messaging (Google LLC) / Apple Push Notification service (APNs) — Dispatching booking reminders, trip status updates, and emergency notifications.

### 6.3 Legal and Regulatory Disclosures
We may disclose information if required by law, court order, subpoena, or government regulation, or if we determine in good faith that disclosure is necessary to investigate safety incidents, fraud, or violations of our Terms of Service.

---

## 7. Device Permissions Requested by the Mobile Apps

Our mobile applications request access to specific hardware and system capabilities only when necessary to perform core app functions:

| Platform | Permission Name | Operational Purpose & Necessity |
| :--- | :--- | :--- |
| **Android / iOS** | **Location (Fine & Coarse / When In Use)** | Used by Learners to specify pickup addresses and by Instructors to view routes to DriveTest centres. |
| **Android / iOS** | **Background Location & Foreground Service** | **Instructors Only:** Required during an active, running ride session to track accurate mileage, trajectory, and arrival times, even when the instructor switches to navigation or locks the device. *Halted immediately upon ride completion.* |
| **Android / iOS** | **Camera & Photo Library / Storage** | Required to capture and upload official documents (Learner G1 licence, DriveTest booking slip; Instructor licence, vehicle ownership, commercial insurance, vehicle inspection photos). |
| **Android / iOS** | **Push Notifications (`POST_NOTIFICATIONS`)** | Transmits real-time ride offers, booking confirmations, schedule changes, and payout notifications. |
| **Android** | **Ignore Battery Optimizations** | Ensures continuous, uninterrupted foreground GPS tracking during active road test rides without being prematurely killed by Android battery management. |

You may revoke permissions at any time through your device operating system settings, though disabling core permissions (such as location during a ride or camera for document submission) may impair critical app functionality.

---

## 8. Data Retention & Deletion Policy

In compliance with Apple App Store Guideline 5.1.1(v) and Google Play Store User Data Policies, we maintain transparent retention schedules and clear self-service deletion workflows.

### 8.1 Retention Schedules
* **Verification Documents:** Uploaded identity and verification documents (G1 licences, DriveTest confirmations, Instructor licences, and vehicle insurance certificates) are retained securely during active account status and permanently deleted from our storage within **ninety (90) days** after account deactivation or document expiration.
* **Active Ride Telemetry:** High-frequency GPS ping coordinates collected during rides are consolidated into aggregate ride distance and route summaries; raw high-frequency telemetry points are purged or anonymized after **one hundred and eighty (180) days**.
* **Financial & Tax Records:** Booking invoices, ride payment records, and instructor payout ledgers are retained for up to **seven (7) years** following the end of the relevant fiscal year to satisfy mandatory Canadian statutory obligations under Canada Revenue Agency (CRA) regulations and commercial contract law.

### 8.2 In-App Account Deletion
Users may initiate the complete deletion of their account at any time directly within the mobile application:
1. Open the **Elan Instructor** (or Customer) App;
2. Navigate to **Profile / Settings**;
3. Select **Delete Account**;
4. Confirm your deletion request.

### 8.3 Web-Based Account Deletion Request
Users who have uninstalled the app or prefer web-based requests may submit an account deletion request through our public deletion portal or by email:
* **Online Deletion Portal:** [https://www.elanroadtestrental.ca/contact-us](https://www.elanroadtestrental.ca/contact-us)
* **Email Request:** [elan.drivetestrental@gmail.com](mailto:elan.drivetestrental@gmail.com) with the subject line *"Account Deletion Request"*.

Upon receipt of a verified deletion request:
* Your profile, login credentials, saved preferences, authentication tokens, and cached files are immediately deactivated and permanently scrubbed within 30 days.
* Any verification documents are queued for immediate permanent deletion.
* Financial and transaction records subject to mandatory CRA 7-year retention are securely isolated and archived strictly for audit defense.

---

## 9. Data Security & Storage Architecture

We implement rigorous technical and organizational safeguards appropriate to the sensitivity of the data:
* **Encryption in Transit:** All communications between our mobile apps, web servers, and third-party APIs are encrypted using modern Transport Layer Security (**TLS 1.3 / HTTPS**).
* **Encryption at Rest:** Sensitive personal data and verification documents stored on AWS cloud servers are protected using industry-standard AES-256 encryption.
* **On-Device Storage Security:** Authentication tokens and session secrets are stored in secure device memory using the Android Keystore and iOS Keychain via `flutter_secure_storage`.
* **Access Control:** Personal data is restricted to authorized personnel who require access to verify documents, fulfill bookings, or provide customer support.

---

## 10. Store-Specific Privacy Declarations

### 10.1 Google Play Store "Data Safety" Disclosure
* **Data Encrypted in Transit:** Yes (TLS 1.3).
* **Data Transfer / Sale:** No user personal data is sold to any third party.
* **Data Deletion Mechanism:** Available both in-app (Settings → Delete Account) and via our public web portal.
* **Data Types Collected & Linked to User:**
  * *Location:* Approximate and Precise Location (App functionality, ride route tracking, fraud prevention).
  * *Personal Info:* Name, Email, Phone number, Address.
  * *Financial Info:* User payment history, Stripe Connect payout identifiers.
  * *Photos & Documents:* Licences, DriveTest slips, vehicle registration/insurance documents.
  * *App Activity & Diagnostics:* Crash logs, performance metrics.
  * *Device or Other Identifiers:* Push notification device tokens.

### 10.2 Apple App Store "App Privacy" Nutrition Label
* **Data Used to Track You:** **None.** (Elan does not track users across third-party apps or websites for targeted advertising. No App Tracking Transparency (ATT) prompt is required.)
* **Data Linked to You:**
  * *Contact Info:* Name, Email Address, Phone Number, Physical Address.
  * *Location:* Precise Location, Coarse Location.
  * *User Content:* Photos, Digital Document Uploads.
  * *Financial Info:* Payment Information / Payout status.
  * *Identifiers:* User ID, Device ID.
  * *Diagnostics:* Crash Data, Performance Data.

---

## 11. Age Limitations & Protection of Minors

Our Services are designed exclusively for individuals preparing for official Ontario driver licensing examinations. The minimum age to obtain an Ontario G1 driver's licence is **sixteen (16) years of age**. 

* **Elan does not knowingly solicit or collect personal information from children under the age of 13 (or under 16 without parental/guardian consent).**
* If we become aware that personal information of a child under 13 has been inadvertently collected without verifiable parental consent, we will take immediate steps to delete such information from our systems. Parents or legal guardians with questions may contact us at [elan.drivetestrental@gmail.com](mailto:elan.drivetestrental@gmail.com).

---

## 12. Individual Rights Under Canadian Privacy Law (PIPEDA)

Subject to applicable Canadian law, you have specific rights concerning your personal information:
* **Right of Access:** You may request a copy of the personal information we hold about you.
* **Right to Rectification:** You may request correction of inaccurate, incomplete, or outdated information.
* **Right to Withdraw Consent:** You may withdraw your consent to data processing at any time, subject to legal or contractual restrictions and reasonable notice.
* **Right to Challenge Compliance:** You may address a challenge concerning our compliance with PIPEDA principles to our designated Privacy Officer.

To exercise any of these rights, please contact our Privacy Officer using the contact details in Section 14 below.

---

## 13. Changes to This Privacy Policy

We may update this Privacy Policy periodically to reflect enhancements to our mobile applications, updates to our operational practices, or changes in legal requirements. 

When modifications occur, we will update the "Last Updated" date at the top of this document. For material modifications, we will provide prominent notice through an in-app notification, email alert, or on our website before the changes take effect. Your continued use of the Services following notification constitutes your acceptance of the revised Policy.

---

## 14. Contact Information & Privacy Officer

If you have questions, feedback, concerns, or requests regarding this Privacy Policy or our privacy practices, please contact our Privacy Officer:

* **Legal / Brand Entity:** Elan Road Test Rental
* **Attention:** Privacy Officer / Compliance Department
* **Headquarters / Mailing Address:** Toronto, ON M5V 2H1, Canada
* **Direct Telephone Support:** +1 (416) 407-4757  
  *(Operating Hours: Monday to Sunday, 8:00 AM – 8:00 PM EST)*
* **Compliance & Support Email:** [elan.drivetestrental@gmail.com](mailto:elan.drivetestrental@gmail.com)  
  *(Alternative / Domain Email: [support@elanroadtestrental.ca](mailto:support@elanroadtestrental.ca))*
* **Official Website:** [https://www.elanroadtestrental.ca](https://www.elanroadtestrental.ca)
* **Customer Support Page:** [https://www.elanroadtestrental.ca/contact-us](https://www.elanroadtestrental.ca/contact-us)
