# FHIRPrimitiveExtension

Examples of how to create  FHIR primitive extension in 3 ways:
1 - Using Dynamic Objects
2 - Using the HS.FHIR.DTL.VR4.Model.* classes
3 - Using the FHIR Object Model classes (since 2024.2)

There are 2 files:
1. Test.Primitive.Transform - a transformation using the HS.FHIR.DTL.vR4.Model.Resource.Patient class
2. Test.Primitive.Demo - the class has 3 methods to demonstrate how to create a FHIR resource with a primitive extension in 3 different ways:
    CreateDynamicFHIR - Using Dynamic Objects
    CreateFHIRClass - Using the HS.FHIR.DTL.vR4.Model.Resource.Patient classes
    CreateFHIRObjectModel - Using the FHIR Object Model classes (since 2024.2)
    
    you can run each of thease class methods in the terminal to see the FHIR resource created.
    do ##class(Test.Primitive.Demo).CreateDynamicFHIR()
    do ##class(Test.Primitive.Demo).CreateFHIRClass()
    do ##class(Test.Primitive.Demo).CreateFHIRObjectModel()
