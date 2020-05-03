#generate_from_xml(DocumentPy)
#generate_from_xml(DocumentObjectPy)
#generate_from_xml(ExtensionPy)
#generate_from_xml(ExtensionContainerPy)
#generate_from_xml(DocumentObjectExtensionPy)
#generate_from_xml(GroupExtensionPy)
#generate_from_xml(LinkBaseExtensionPy)
#generate_from_xml(DocumentObjectGroupPy)
#generate_from_xml(GeoFeaturePy)
#generate_from_xml(GeoFeatureGroupExtensionPy)
#generate_from_xml(OriginGroupExtensionPy)
#generate_from_xml(PartPy)

#generate_from_xml(ComplexGeoDataPy)
#generate_from_xml(PropertyContainerPy)
#generate_from_xml(MaterialPy)

#generate_from_py(FreeCADInit InitScript.h)
#generate_from_py(FreeCADTest TestScript.h)

OTHER_FILES += \
#SET(FreeCADApp_XML_SRCS
    ExtensionPy.xml \
    ExtensionContainerPy.xml \
    DocumentObjectExtensionPy.xml \
    GroupExtensionPy.xml \
    LinkBaseExtensionPy.xml \
    DocumentObjectGroupPy.xml \
    DocumentObjectPy.xml \
    GeoFeaturePy.xml \
    GeoFeatureGroupExtensionPy.xml \
    OriginGroupExtensionPy.xml \
    PartPy.xml \
    DocumentPy.xml \
    PropertyContainerPy.xml \
    ComplexGeoDataPy.xml \
    MaterialPy.xml \
#)
#SOURCE_GROUP("XML" FILES ${FreeCADApp_XML_SRCS})
