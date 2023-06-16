import ballerinax/health.fhir.r4.uscore501;
import ballerina/log;
import ballerinax/health.fhir.r4;
import ballerina/io;

public function main() {

    io:println("FHIR R4 US Core 3.1.0 Patient Model");

    json patientPayload = {
        "resourceType": "Patient",
        "id": "1",
        "meta": {
            "profile": [
                "http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient"
            ]
        },
        "active": true,
        "name": [
            {
                "use": "official",
                "family": "Chalmers",
                "given": [
                    "Peter",
                    "James"
                ]
            }
        ],
        "gender": "male",
        "birthDate": "1974-12-25",
        "managingOrganization": {
            "reference": "Organization/1"
        }
    };

    do {
        anydata parsedResult = check r4:parse(patientPayload, uscore501:USCorePatientProfile);
        uscore501:USCorePatientProfile patientModel = check parsedResult.ensureType();
        log:printInfo("Patient name : " + patientModel.name.toString());

    } on fail error parseError {
        log:printError("Error occurred while parsing : " + parseError.message(), parseError);
    }

}
