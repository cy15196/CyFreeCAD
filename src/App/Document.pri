SOURCES += \
    Annotation.cpp \
    Document.cpp \
    DocumentObject.cpp \
    Extension.cpp \
    ExtensionPyImp.cpp \
    DocumentObjectExtension.cpp \
    DocumentObjectExtensionPyImp.cpp \
    ExtensionContainer.cpp \
    ExtensionContainerPyImp.cpp \
    GroupExtension.cpp \
    GroupExtensionPyImp.cpp \
    DocumentObjectFileIncluded.cpp \
    DocumentObjectGroup.cpp \
    DocumentObjectGroupPyImp.cpp \
    GeoFeaturePyImp.cpp \
    DocumentObjectPyImp.cpp \
    DocumentObserver.cpp \
    DocumentObserverPython.cpp \
    DocumentPyImp.cpp \
    Expression.cpp \
    FeaturePython.cpp \
    FeatureTest.cpp \
    GeoFeature.cpp \
    GeoFeatureGroupExtensionPyImp.cpp \
    GeoFeatureGroupExtension.cpp \
    OriginGroupExtensionPyImp.cpp \
    OriginGroupExtension.cpp \
    PartPyImp.cpp \
    Part.cpp \
    Origin.cpp \
    Path.cpp \
    InventorObject.cpp \
    MeasureDistance.cpp \
    Placement.cpp \
    OriginFeature.cpp \
    Range.cpp \
    Transactions.cpp \
    TransactionalObject.cpp \
    VRMLObject.cpp \
    MaterialObject.cpp \
    MergeDocuments.cpp \
    TextDocument.cpp \
    Link.cpp \
    LinkBaseExtensionPyImp.cpp \
#)

#SET(Document_HPP_SRCS
HEADERS += \
    Annotation.h \
    Document.h \
    DocumentObject.h \
    Extension.h \
    ExtensionContainer.h \
    GroupExtension.h \
    DocumentObjectExtension.h \
    DocumentObjectFileIncluded.h \
    DocumentObjectGroup.h \
    DocumentObserver.h \
    DocumentObserverPython.h \
    Expression.h \
    ExpressionParser.h \
    ExpressionVisitors.h \
    FeatureCustom.h \
    FeaturePython.h \
    FeaturePythonPyImp.h \
    FeaturePythonPyImp.inl \
    FeatureTest.h \
    GeoFeature.h \
    GeoFeatureGroupExtension.h \
    OriginGroupExtension.h \
    Part.h \
    Origin.h \
    Path.h \
    InventorObject.h \
    MeasureDistance.h \
    Placement.h \
    OriginFeature.h \
    Range.h \
    Transactions.h \
    TransactionalObject.h \
    VRMLObject.h \
    MaterialObject.h \
    MergeDocuments.h \
    TextDocument.h \
    Link.h \
#)
#SET(Document_SRCS
#    ${Document_CPP_SRCS}
#    ${Document_HPP_SRCS}
#)
#SOURCE_GROUP("Document" FILES ${Document_SRCS})
