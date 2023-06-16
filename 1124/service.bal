import ballerinax/health.fhir.r4;
import ballerina/http;

service / on new http:Listener(9089) {
    isolated resource function get fhir/r4/Patient/[string id]() returns r4:Patient|r4:FHIRError? {
        return getPatient(id);
    }
}       
