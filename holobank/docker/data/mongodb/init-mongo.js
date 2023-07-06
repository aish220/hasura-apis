const data = [
    {
        "userId": 1,
        "customerIdentificationData": {
            "firstName": "Emelia",
            "lastName": "Chapman",
            "dateOfBirth": "1990-01-01",
            "nationality": "Australia",
            "gender": "Female",
            "identificationNumber": "PA8744612"
        },
        "proofOfIdentityDocuments": [
            {
                "documentType": "Passport",
                "documentNumber": "123456789",
                "issueDate": "2015-01-01",
                "expiryDate": "2025-01-01",
                "issuingAuthority": "Australia",
                "documentImage": "URL_or_binary_data_of_passport_image"
            }
        ],
        "proofOfAddressDocuments": [
            {
                "documentType": "Utility Bill",
                "documentDate": "2023-04-01",
                "issuer": "Energy Australia",
                "documentImage": "URL_or_binary_data_of_utility_bill_image"
            }
        ],
        "contactInformation": {
            "phoneNumbers": ["+61-492-412-128"],
            "emailAddresses": ["emelia.chapman90@gmail.com"]
        },
        "employmentAndIncomeInformation": {
            "occupation": "Software Engineer",
            "employer": "Australian Broadcasting Coorporation",
            "income": 162000,
            "sourcesOfWealth": ["Salary"]
        },
        "pepStatus": "None",
        "riskAssessmentData": {
            "riskProfile": "Low",
            "riskScore": 10
        },
        "customerDueDiligenceRecords": [
            {
                "activity": "Document Verification",
                "date": "2023-04-30",
                "summary": "All documents verified and found to be authentic."
            }
        ],
        "ongoingMonitoringData": [
            {
                "activity": "Transaction Monitoring",
                "date": "2023-04-30",
                "summary": "No suspicious transactions found in the past month."
            }
        ],
        "auditTrailsAndCaseManagement": [
            {
                "activity": "New Account Opening",
                "date": "2023-04-29",
                "summary": "Account opened after completing KYC process."
            }
        ]
    },
    {
        "userId": 2,
        "customerIdentificationData": {
            "firstName": "Bernard",
            "lastName": "Rojas",
            "dateOfBirth": "1985-03-15",
            "nationality": "UK",
            "gender": "Male",
            "identificationNumber": "987654321"
        },
        "proofOfIdentityDocuments": [
            {
                "documentType": "Driver's License",
                "documentNumber": "987654321",
                "issueDate": "2010-06-01",
                "expiryDate": "2030-06-01",
                "issuingAuthority": "Service New South Wales",
                "documentImage": "URL_or_binary_data_of_license_image"
            }
        ],
        "proofOfAddressDocuments": [
            {
                "documentType": "Bank Statement",
                "documentDate": "2023-05-01",
                "issuer": "Commonwealth Bank of Australia",
                "documentImage": "URL_or_binary_data_of_bank_statement_image"
            }
        ],
        "contactInformation": {
            "phoneNumbers": ["+61-412-645-901"],
            "emailAddresses": ["brojas@ey.com"]
        }
    },
    {
        "userId": 3,
        "customerIdentificationData": {
            "firstName": "Rory",
            "lastName": "Hodge",
            "dateOfBirth": "1992-08-05",
            "nationality": "Australia",
            "gender": "Male",
            "identificationNumber": "543-21-9876"
        },
        "proofOfIdentityDocuments": [
            {
                "documentType": "Passport",
                "documentNumber": "PA1488041",
                "issueDate": "2015-02-15",
                "expiryDate": "2025-02-15",
                "issuingAuthority": "Australia",
                "documentImage": "URL_or_binary_data_of_id_card_image"
            }
        ],
        "proofOfAddressDocuments": [
            {
                "documentType": "Rental Agreement",
                "documentDate": "2023-03-01",
                "issuer": "Bresic Whitney",
                "documentImage": "URL_or_binary_data_of_rental_agreement_image"
            }
        ],
        "contactInformation": {
            "phoneNumbers": ["+61-468-456-001"],
            "emailAddresses": ["rory.hodge@gmail.com"]
        },
        "employmentAndIncomeInformation": {
            "occupation": "Director of Engineering",
            "employer": "Qantas",
            "income": 175000,
            "sourcesOfWealth": ["Salary"]
        },
        "pepStatus": "None",
        "riskAssessmentData": {
            "riskProfile": "Low",
            "riskScore": 10
        },
        "customerDueDiligenceRecords": [
            {
                "activity": "Document Verification",
                "date": "2023-05-15",
                "summary": "All documents verified and found to be authentic."
            }
        ],
        "ongoingMonitoringData": [
            {
                "activity": "Transaction Monitoring",
                "date": "2023-05-15",
                "summary": "No suspicious transactions found in the past month."
            }
        ],
        "auditTrailsAndCaseManagement": [
            {
                "activity": "New Account Opening",
                "date": "2023-05-14",
                "summary": "Account opened after completing KYC process."
            }
        ]
    },
    {
        "userId": 4,
        "customerIdentificationData": {
            "firstName": "Clarence",
            "lastName": "Munoz",
            "dateOfBirth": "1987-11-20",
            "nationality": "Australia",
            "gender": "Male",
            "identificationNumber": "478459123"
        },
        "proofOfIdentityDocuments": [
            {
                "documentType": "Driver's License",
                "documentNumber": "22814958",
                "issueDate": "2010-01-01",
                "expiryDate": "2030-01-01",
                "issuingAuthority": "Australia",
                "documentImage": "URL_or_binary_data_of_license_image"
            }
        ],
        "proofOfAddressDocuments": [
            {
                "documentType": "Utility Bill",
                "documentDate": "2023-04-15",
                "issuer": "Origin Energy",
                "documentImage": "URL_or_binary_data_of_utility_bill_image"
            }
        ],
        "contactInformation": {
            "phoneNumbers": ["+61-476-112-813"],
            "emailAddresses": ["cmunoz12@hotmail.com"]
        }
    },
    {
        "userId": 5,
        "customerIdentificationData": {
            "firstName": "Virginia",
            "lastName": "Reilly",
            "dateOfBirth": "1993-06-10",
            "nationality": "US",
            "gender": "Female",
            "identificationNumber": "42197491268412"
        },
        "proofOfIdentityDocuments": [
            {
                "documentType": "Social Security Number",
                "documentNumber": "42197491268412",
                "issueDate": "2010-08-01",
                "expiryDate": "2110-08-01",
                "issuingAuthority": "United States",
                "documentImage": "URL_or_binary_data_of_id_card_image"
            }
        ],
        "proofOfAddressDocuments": [
            {
                "documentType": "Bank of America",
                "documentDate": "2023-05-01",
                "issuer": "Bank",
                "documentImage": "URL_or_binary_data_of_bank_statement_image"
            }
        ],
        "contactInformation": {
            "phoneNumbers": ["+1-123-456-7890"],
            "emailAddresses": ["virginiareilly2@bofa.com"]
        },
        "employmentAndIncomeInformation": {
            "occupation": "Bank Manager",
            "employer": "Bank of America",
            "income": 65000,
            "sourcesOfWealth": ["Salary"]
        },
        "pepStatus": "None",
        "riskAssessmentData": {
            "riskProfile": "Medium",
            "riskScore": 40
        },
        "customerDueDiligenceRecords": [
            {
                "activity": "Document Verification",
                "date": "2023-05-15",
                "summary": "All documents verified and found to be authentic."
            }
        ],
        "ongoingMonitoringData": [
            {
                "activity": "Transaction Monitoring",
                "date": "2023-05-15",
                "summary": "No suspicious transactions found in the past month."
            }
        ],
        "auditTrailsAndCaseManagement": [
            {
                "activity": "New Account Opening",
                "date": "2023-05-14",
                "summary": "Account opened after completing KYC process."
            }
        ]
    },
    {
        "userId": 6,
        "customerIdentificationData": {
            "firstName": "Seren",
            "lastName": "Lara",
            "dateOfBirth": "1982-09-25",
            "nationality": "Sweden",
            "gender": "Male",
            "identificationNumber": "BA821340001"
        },
        "proofOfIdentityDocuments": [
            {
                "documentType": "Passport",
                "documentNumber": "BA821340001",
                "issueDate": "2022-01-01",
                "expiryDate": "2032-01-01",
                "issuingAuthority": "Sweden",
                "documentImage": "URL_or_binary_data_of_passport_image"
            }
        ],
        "proofOfAddressDocuments": [
            {
                "documentType": "Utility Bill",
                "documentDate": "2023-05-15",
                "issuer": "British Telecom",
                "documentImage": "URL_or_binary_data_of_utility_bill_image"
            }
        ],
        "contactInformation": {
            "phoneNumbers": ["+44-01502-844-122"],
            "emailAddresses": ["seren.lara82@gmail.com"]
        }
    },
    {
        "userId": 7,
        "customerIdentificationData": {
            "firstName": "Abbie",
            "lastName": "Horne",
            "dateOfBirth": "1991-12-08",
            "nationality": "New Zealand",
            "gender": "Female",
            "identificationNumber": "931248512"
        },
        "proofOfIdentityDocuments": [
            {
                "documentType": "Passport",
                "documentNumber": "931248512",
                "issueDate": "2022-02-15",
                "expiryDate": "2032-02-15",
                "issuingAuthority": "New Zealand",
                "documentImage": "URL_or_binary_data_of_license_image"
            }
        ],
        "proofOfAddressDocuments": [
            {
                "documentType": "Bank of New Zealand",
                "documentDate": "2023-05-15",
                "issuer": "Bank",
                "documentImage": "URL_or_binary_data_of_bank_statement_image"
            }
        ],
        "contactInformation": {
            "phoneNumbers": ["+64-823-112-749"],
            "emailAddresses": ["ahorne@employmenthero.com"]
        },
        "employmentAndIncomeInformation": {
            "occupation": "Accountant",
            "employer": "Employment Hero",
            "income": 80000,
            "sourcesOfWealth": ["Salary"]
        },
        "pepStatus": "None",
        "riskAssessmentData": {
            "riskProfile": "Medium",
            "riskScore": 25
        },
        "customerDueDiligenceRecords": [
            {
                "activity": "Document Verification",
                "date": "2023-05-15",
                "summary": "All documents verified and found to be authentic."
            }
        ],
        "ongoingMonitoringData": [
            {
                "activity": "Transaction Monitoring",
                "date": "2023-05-15",
                "summary": "No suspicious transactions found in the past month."
            }
        ],
        "auditTrailsAndCaseManagement": [
            {
                "activity": "New Account Opening",
                "date": "2023-05-14",
                "summary": "Account opened after completing KYC process."
            }
        ]
    },
    {
        "userId": 8,
        "customerIdentificationData": {
            "firstName": "Sara",
            "lastName": "Pineda",
            "dateOfBirth": "1986-07-17",
            "nationality": "Chile",
            "gender": "Female",
            "identificationNumber": "PP7TH312423"
        },
        "proofOfIdentityDocuments": [
            {
                "documentType": "Passport",
                "documentNumber": "PP7TH312423",
                "issueDate": "2010-01-01",
                "expiryDate": "2030-01-01",
                "issuingAuthority": "Chile",
                "documentImage": "URL_or_binary_data_of_passport_image"
            }
        ],
        "proofOfAddressDocuments": [
            {
                "documentType": "Utility Bill",
                "documentDate": "2023-05-15",
                "issuer": "Melbourne Water",
                "documentImage": "URL_or_binary_data_of_utility_bill_image"
            }
        ],
        "contactInformation": {
            "phoneNumbers": ["+61-443-091-282"],
            "emailAddresses": ["sara.pineda86@hotmail.com"]
        }
    },
    {
        "userId": 9,
        "customerIdentificationData": {
            "firstName": "Rico",
            "lastName": "Wheeler",
            "dateOfBirth": "1995-04-12",
            "nationality": "Spain",
            "gender": "Male",
            "identificationNumber": "773849278"
        },
        "proofOfIdentityDocuments": [
            {
                "documentType": "Driver's License",
                "documentNumber": "773849278",
                "issueDate": "2010-08-01",
                "expiryDate": "2030-08-01",
                "issuingAuthority": "Victoria",
                "documentImage": "URL_or_binary_data_of_id_card_image"
            }
        ],
        "proofOfAddressDocuments": [
            {
                "documentType": "Bank Statement",
                "documentDate": "2023-05-15",
                "issuer": "National Australia Bank",
                "documentImage": "URL_or_binary_data_of_bank_statement_image"
            }
        ],
        "contactInformation": {
            "phoneNumbers": ["+61-412-442-875"],
            "emailAddresses": ["ricoswheels@yahoo.com.au"]
        },
        "employmentAndIncomeInformation": {
            "occupation": "Graphic Designer",
            "employer": "Loud & Clear",
            "income": 155000,
            "sourcesOfWealth": ["Salary"]
        },
        "pepStatus": "None",
        "riskAssessmentData": {
            "riskProfile": "Low",
            "riskScore": 15
        },
        "customerDueDiligenceRecords": [
            {
                "activity": "Document Verification",
                "date": "2023-05-15",
                "summary": "All documents verified and found to be authentic."
            }
        ],
        "ongoingMonitoringData": [
            {
                "activity": "Transaction Monitoring",
                "date": "2023-05-15",
                "summary": "No suspicious transactions found in the past month."
            }
        ],
        "auditTrailsAndCaseManagement": [
            {
                "activity": "New Account Opening",
                "date": "2023-05-14",
                "summary": "Account opened after completing KYC process."
            }
        ]
    },
    {
        "userId": 10,
        "customerIdentificationData": {
            "firstName": "Zachary",
            "lastName": "McLaughlin",
            "dateOfBirth": "1988-02-28",
            "nationality": "Scotland",
            "gender": "Male",
            "identificationNumber": "RR72834922K"
        },
        "proofOfIdentityDocuments": [
            {
                "documentType": "Driver's License",
                "documentNumber": "88573346",
                "issueDate": "2022-01-01",
                "expiryDate": "2032-01-01",
                "issuingAuthority": "New South Wales",
                "documentImage": "URL_or_binary_data_of_passport_image"
            }
        ],
        "proofOfAddressDocuments": [
            {
                "documentType": "Utility Bill",
                "documentDate": "2023-05-15",
                "issuer": "Vodafone",
                "documentImage": "URL_or_binary_data_of_utility_bill_image"
            }
        ],
        "contactInformation": {
            "phoneNumbers": ["+64-423-449-121"],
            "emailAddresses": ["zachary.mclaughlin@member.ses.nsw.gov.au"]
        }
    }
];

db.createCollection("kyc", {
    validator: {
        "$jsonSchema": {
            "bsonType": "object",
            "required": ["userId", "customerIdentificationData"],
            "properties": {
                "userId": {
                    "bsonType": "int"
                },
                "customerIdentificationData": {
                    "bsonType": "object",
                    "required": ["firstName", "lastName", "dateOfBirth", "nationality", "gender", "identificationNumber"],
                    "properties": {
                        "firstName": {
                            "bsonType": "string"
                        },
                        "lastName": {
                            "bsonType": "string"
                        },
                        "dateOfBirth": {
                            "bsonType": "string",
                        },
                        "nationality": {
                            "bsonType": "string"
                        },
                        "gender": {
                            "bsonType": "string"
                        },
                        "identificationNumber": {
                            "bsonType": "string"
                        }
                    }
                },
                "proofOfIdentityDocuments": {
                    "bsonType": "array",
                    "items": {
                        "bsonType": "object",
                        "required": ["documentType", "documentNumber", "issueDate", "expiryDate", "issuingAuthority", "documentImage"],
                        "properties": {
                            "documentType": {
                                "bsonType": "string"
                            },
                            "documentNumber": {
                                "bsonType": "string"
                            },
                            "issueDate": {
                                "bsonType": "string",
                            },
                            "expiryDate": {
                                "bsonType": "string",
                            },
                            "issuingAuthority": {
                                "bsonType": "string"
                            },
                            "documentImage": {
                                "bsonType": "string"
                            }
                        }
                    }
                },
                "proofOfAddressDocuments": {
                    "bsonType": "array",
                    "items": {
                        "bsonType": "object",
                        "required": ["documentType", "documentDate", "issuer", "documentImage"],
                        "properties": {
                            "documentType": {
                                "bsonType": "string"
                            },
                            "documentDate": {
                                "bsonType": "string",
                            },
                            "issuer": {
                                "bsonType": "string"
                            },
                            "documentImage": {
                                "bsonType": "string"
                            }
                        }
                    }
                },
                "contactInformation": {
                    "bsonType": "object",
                    "required": ["phoneNumbers", "emailAddresses"],
                    "properties": {
                        "phoneNumbers": {
                            "bsonType": "array",
                            "items": {
                                "bsonType": "string"
                            }
                        },
                        "emailAddresses": {
                            "bsonType": "array",
                            "items": {
                                "bsonType": "string"
                            }
                        }
                    }
                },
                "employmentAndIncomeInformation": {
                    "bsonType": "object",
                    "required": ["occupation", "employer", "income", "sourcesOfWealth"],
                    "properties": {
                        "occupation": {
                            "bsonType": "string"
                        },
                        "employer": {
                            "bsonType": "string"
                        },
                        "income": {
                            "bsonType": "number"
                        },
                        "sourcesOfWealth": {
                            "bsonType": "array",
                            "items": {
                                "bsonType": "string"
                            }
                        }
                    }
                },
                "pepStatus": {
                    "bsonType": "string"
                },
                "riskAssessmentData": {
                    "bsonType": "object",
                    "required": ["riskProfile", "riskScore"],
                    "properties": {
                        "riskProfile": {
                            "bsonType": "string"
                        },
                        "riskScore": {
                            "bsonType": "int"
                        }
                    }
                },
                "customerDueDiligenceRecords": {
                    "bsonType": "array",
                    "items": {
                        "bsonType": "object",
                        "required": ["activity", "date", "summary"],
                        "properties": {
                            "activity": {
                                "bsonType": "string"
                            },
                            "date": {
                                "bsonType": "string",
                            },
                            "summary": {
                                "bsonType": "string"
                            }
                        }
                    }
                },
                "ongoingMonitoringData": {
                    "bsonType": "array",
                    "items": {
                        "bsonType": "object",
                        "required": ["activity", "date", "summary"],
                        "properties": {
                            "activity": {
                                "bsonType": "string"
                            },
                            "date": {
                                "bsonType": "string",
                            },
                            "summary": {
                                "bsonType": "string"
                            }
                        }
                    }
                },
                "auditTrailsAndCaseManagement": {
                    "bsonType": "array",
                    "items": {
                        "bsonType": "object",
                        "required": ["activity", "date", "summary"],
                        "properties": {
                            "activity": {
                                "bsonType": "string"
                            },
                            "date": {
                                "bsonType": "string",
                            },
                            "summary": {
                                "bsonType": "string"
                            }
                        }
                    }
                }
            }
        }
    }
})
db.getSiblingDB(process.env.MONGO_INITDB_DATABASE).kyc.insertMany(data);
