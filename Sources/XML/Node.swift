import libxml2

import DOM

extension Node: Constructable {
    public static func construct(with rawValue: xmlNodePtr?) -> Node? {
        guard let rawValue = rawValue else {
            return nil
        }

        switch rawValue.pointee.type {
        case XML_ELEMENT_NODE:
            return Element(rawValue: rawValue)
        case XML_DOCUMENT_NODE:
            return Document(rawValue: rawValue.pointee.doc)
        case XML_TEXT_NODE:
            return Text(rawValue: rawValue)
        case XML_COMMENT_NODE:
            return Comment(rawValue: rawValue)
        case XML_PI_NODE:
            return ProcessingInstruction(rawValue: rawValue)
        case XML_CDATA_SECTION_NODE:
            return CDATA(rawValue: rawValue)
        default:
            return nil
        }
    }

}

