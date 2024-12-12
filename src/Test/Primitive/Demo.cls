Class Test.Primitive.Demo Extends %RegisteredObject
{

ClassMethod CreateDynamicFHIR()
{
    set resource = {}

    set resource.resourceType       = "Patient"
    do resource.%Set("active",1,"boolean")
    set resource.gender             = "female"
    set resource.birthDate          = "1984-12-24"
    set resource."_birthDate"       = {}
    set resource."_birthDate".id    = "123456"

    // create a new extension
    set extension               = {}
    set extension.url            = "http://example.org/fhir/StructureDefinition/Holiday"
    set extension.valueString   = "Christmas"

    // Add the extension to the extension array
    set resource."_birthDate".extension = []
    do resource."_birthDate".extension.%Push(extension)

    write resource.toJson()
}

ClassMethod CreateFHIRClass()
{
    // Create a new patient resource
    set resource=##class(HS.FHIR.DTL.vR4.Model.Resource.Patient).%New()

    set resource.active=1
    set resource.gender="female"
    // create a new extension
    set extension=##class(HS.FHIR.DTL.vR4.Model.Base.Extension).%New()
    set extension.url="http://example.org/fhir/StructureDefinition/Holiday"
    set extension.valueString="Christmas"
    // Add the extension to the primitive extension list
    do resource.primitiveExtension.Insert(extension)

    // point the property to the extention index (#1 in this example)
    set resource.birthDate=$listbuild("1984-12-24",1)
    write resource.ToJSON().Read()
}

ClassMethod CreateFHIRObjectModel()
{

    #dim patient as HS.FHIRModel.R4.Patient
    #dim extension as HS.FHIRModel.R4.Extension

    set patient=##class(HS.FHIRModel.R4.Patient).%New()
    set patient.gender="female"
    set patient.active=1

    set patient.birthDate="1984-12-24"

    // create a new element
    set element=##class(HS.FHIRModel.R4.Element).%New()
    do element.IncludeExtension()

    // create a new extension
    set extension=element.extension.MakeEntry()
    set extension.url="http://example.org/fhir/StructureDefinition/Holiday"
    set extension.valueString="Christmas"
    
    // add the extension to the element
    do element.extension.add(extension)
    
    // add the element to the resource
    set patient."_birthDate"=element
    
    write patient.toString()
}

}
