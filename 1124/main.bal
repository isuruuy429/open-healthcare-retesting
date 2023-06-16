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
            birthDate: "1989-04-29",
            "_birthdate": {
                id: "1989-04-29",
                extension: [
                    {
                        url: "http://hl7.org/fhir/StructureDefinition/patient-birthTime",
                        valueTime: "1989-04-29T00:00:00+05:30"
                    }
                ]
            },
            gender: "male",
            "_gender": {
                id: "_personGender",
                extension: [
                    {
                        url: "http://hl7.org/fhir/ValueSet/administrative-gender",
                        valueCode: "Malke"
                    }
                ]
            },
            deceasedBoolean: true,
            "_deceasedDateTime": {
                id: "2022-02-23",
                extension: [
                    {
                        url: "http://hl7.org/fhir/StructureDefinition/patient-deceasedTime",
                        valueDateTime: "2022-02-23T00:00:00+05:30"
                    }
                ]
            },
            multipleBirthBoolean: true,
            multipleBirthInteger: 2,
            "_multipleBirthInteger": {
                id: "2",
                extension: [
                    {
                        url: "http://hl7.org/fhir/StructureDefinition/patient-multipleBirthInteger",
                        valueInteger: 2
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
