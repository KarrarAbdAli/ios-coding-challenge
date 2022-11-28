//
//  Shift.swift
//  CodingChallenge
//
//  Created by Karrar Abd Ali on 28/11/2022.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.

import Foundation

// MARK: - Result
struct Result: Codable {
    let data: [Datum]
    let links: [JSONAny]
    let meta: Meta
}

// MARK: - Datum
struct Datum: Identifiable, Codable {
    var id: String? = UUID().uuidString
    
    let date: String
    var shifts: [Shift]?
}

// MARK: - Shift
struct Shift: Codable {
    let shiftID: Int
    let startTime, endTime: String?
    let normalizedStartDateTime, normalizedEndDateTime: String
    let timezone: Timezone
    let premiumRate, covid: Bool
    let shiftKind: ShiftKind
    let withinDistance: Int
    let facilityType, skill: FacilityType
    let localizedSpecialty: LocalizedSpecialty

    enum CodingKeys: String, CodingKey {
        case shiftID = "shift_id"
        case startTime = "start_time"
        case endTime = "end_time"
        case normalizedStartDateTime = "normalized_start_date_time"
        case normalizedEndDateTime = "normalized_end_date_time"
        case timezone
        case premiumRate = "premium_rate"
        case covid
        case shiftKind = "shift_kind"
        case withinDistance = "within_distance"
        case facilityType = "facility_type"
        case skill
        case localizedSpecialty = "localized_specialty"
    }
}

// MARK: - FacilityType
struct FacilityType: Codable {
    let id: Int
    let name: FacilityTypeName
    let color: Color
    let abbreviation: FacilityTypeAbbreviation?
}

enum FacilityTypeAbbreviation: String, Codable {
    case cmaCmtQma = "CMA/CMT/QMA"
    case cna = "CNA"
    case da = "DA"
    case dh = "DH"
    case lvnLpn = "LVN/LPN"
    case ot = "OT"
    case pta = "PTA"
    case rn = "RN"
    case rt = "RT"
}

enum Color: String, Codable {
    case af52De = "#AF52DE"
    case bf0034 = "#BF0034"
    case db8Bff = "#DB8BFF"
    case f5657C = "#F5657C"
    case ff2D55 = "#FF2D55"
    case ff9500 = "#FF9500"
    case the000000 = "#000000"
    case the007Aff = "#007AFF"
    case the149Bcb = "#149BCB"
    case the3631B4 = "#3631B4"
    case the5856D6 = "#5856D6"
    case the5Ac8Fa = "#5AC8FA"
    case the7202A3 = "#7202A3"
    case the8Bc34A = "#8BC34A"
}

enum FacilityTypeName: String, Codable {
    case acuteCare = "Acute Care"
    case assistedLivingFacility = "Assisted Living Facility"
    case behavioralHealthFacility = "Behavioral Health Facility"
    case certifiedNursingAide = "Certified Nursing Aide"
    case dentalAssistant = "Dental Assistant"
    case dentalClinic = "Dental Clinic"
    case dentalHygienist = "Dental Hygienist"
    case dentistryClinic = "Dentistry Clinic"
    case er = "ER"
    case healthcareFacility = "Healthcare Facility"
    case hospital = "Hospital"
    case inPatientRehabHospital = "In-Patient Rehab Hospital"
    case licensedVocationalPracticalNurse = "Licensed Vocational/Practical Nurse"
    case longTermAcuteCare = "Long Term Acute Care"
    case longTermCare = "Long Term Care"
    case medSurg = "Med/Surg"
    case medicationAideTech = "Medication Aide/Tech"
    case occupationalTherapist = "Occupational Therapist"
    case or = "OR"
    case outpatientClinic = "Outpatient Clinic"
    case physicalTherapistAssistant = "Physical Therapist Assistant"
    case psychiatric = "Psychiatric"
    case registeredNurse = "Registered Nurse"
    case rehabilitationFacility = "Rehabilitation Facility"
    case respiratoryTherapist = "Respiratory Therapist"
    case skilledNursingFacility = "Skilled Nursing Facility"
}

// MARK: - LocalizedSpecialty
struct LocalizedSpecialty: Codable {
    let id, specialtyID, stateID: Int
    let name: LocalizedSpecialtyName
    let abbreviation: LocalizedSpecialtyAbbreviation
    let specialty: FacilityType

    enum CodingKeys: String, CodingKey {
        case id
        case specialtyID = "specialty_id"
        case stateID = "state_id"
        case name, abbreviation, specialty
    }
}

enum LocalizedSpecialtyAbbreviation: String, Codable {
    case cma = "CMA"
    case cna = "CNA"
    case dh = "DH"
    case lvn = "LVN"
    case ot = "OT"
    case pta = "PTA"
    case rcp = "RCP"
    case rda = "RDA"
    case rn = "RN"
}

enum LocalizedSpecialtyName: String, Codable {
    case certifiedMedicationAide = "Certified Medication Aide"
    case certifiedNursingAide = "Certified Nursing Aide"
    case dentalAssistant = "Dental Assistant"
    case dentalHygienist = "Dental Hygienist"
    case licensedVocationalNurse = "Licensed Vocational Nurse"
    case occupationalTherapist = "Occupational Therapist"
    case physicalTherapistAssistant = "Physical Therapist Assistant"
    case registeredNurse = "Registered Nurse"
    case respiratoryCarePractitioner = "Respiratory Care Practitioner"
}

enum ShiftKind: String, Codable {
    case dayShift = "Day Shift"
    case eveningShift = "Evening Shift"
    case nightShift = "Night Shift"
}

enum Timezone: String, Codable {
    case central = "Central"
}

// MARK: - Meta
struct Meta: Codable {
    let lat, lng: Double
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
