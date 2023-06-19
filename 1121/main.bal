import ballerinax/health.fhir.r4;
import ballerina/http;

//create a function with primitive type extension
isolated function getPatient(string id) returns r4:Patient|r4:FHIRError? {
    do {
        r4:Patient patient = {
            id: "13847288",
            identifier: [
                {
                    system: "http://acme.org/patient",
                    value: "13847288"
                }
            ],
            "___active": {
                id: "active",
                extension: [
                    {
                        url: "http://hl7.org/fhir/StructureDefinition/patient-active",
                        valueBoolean: true
                    }
                ]
            },
            "__deceasedBoolean": {
                id: "deceasedBoolean",
                extension: [
                    {
                        url: "http://hl7.org/fhir/StructureDefinition/patient-deceasedBoolean",
                        valueBoolean: false
                    }
                ]
            },
            address: [
                {
                    use: "work",
                    line: [
                        "534 Erewhon St"
                    ],
                    text: "534 Erewhon St PeasantVille, Rainbow, Vic  3999",
                    city: "PleasantVille",
                    state: "Rainbow",
                    "__state" : {
                        id: "state",
                        extension: [
                            {
                                url: "http://hl7.org/fhir/StructureDefinition/iso21090-codedString",
                                valueString: "Rainbow"
                            }
                        ]
                    },
                    postalCode: "3999",
                    country: "USA",
                    "__country" : {
                        id: "country",
                        extension: [
                            {
                                url: "http://hl7.org/fhir/StructureDefinition/iso21090-codedString",
                                valueString: "US"
                            }
                        ]
                    }
                }
            ],
            birthDate: "1989-04-29",
            "___address": {
                id: "address",
                extension: [
                    {
                        url: "http://hl7.org/fhir/StructureDefinition/patient-address",
                        valueAddress: {
                            use: "work",
                            line: [
                                "534 Erewhon St"
                            ],
                            text: "534 Erewhon St PeasantVille, Rainbow, Vic  3999",
                            city: "PleasantVille",
                            state: "Rainbow",
                            "__state" : {
                                id: "state",
                                extension: [
                                    {
                                        url: "http://hl7.org/fhir/StructureDefinition/iso21090-codedString",
                                        valueString: "Rainbow"
                                    }
                                ]
                            },
                            postalCode: "3999",
                            country: "USA",
                            "__country" : {
                                id: "country",
                                extension: [
                                    {
                                        url: "http://hl7.org/fhir/StructureDefinition/iso21090-codedString",
                                        valueString: "US"
                                    }
                                ]
                            }
                        }
                    }
                ]
            },
            "__name" : {
                id: "name",
                extension: [
                    {
                        url: "http://hl7.org/fhir/StructureDefinition/patient-name",
                        valueHumanName: {
                            use: "official",
                            text: "Peter James Chalmers",
                            family: "Chalmers",
                            given: [
                                "Peter",
                                "James"
                            ]
                        }
                    }
                ]
            }
            
        };
        return patient;
    }
    on fail var e {
        r4:FHIRError fhirError = r4:createFHIRError(e.toString(), r4:CODE_SEVERITY_FATAL, r4:CODE_TYPE_INFORMATIONAL,
        httpStatusCode = http:STATUS_NOT_FOUND);
        return fhirError;
    }

}
