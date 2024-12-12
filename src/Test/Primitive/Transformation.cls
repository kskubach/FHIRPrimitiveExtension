Class Test.Primitive.Transformation Extends Ens.DataTransformDTL [ DependsOn = (Ens.StringRequest, HS.FHIR.DTL.vR4.Model.Resource.Patient) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='Ens.StringRequest' targetClass='HS.FHIR.DTL.vR4.Model.Resource.Patient' create='new' language='objectscript' >
<assign value='1' property='target.active' action='set' />
<assign value='"female"' property='target.gender' action='set' />
<comment>
<annotation>Create an extention</annotation>
</comment>
<assign value='##class(HS.FHIR.DTL.vR4.Model.Base.Extension).%New()' property='tmp' action='set' />
<assign value='"http://example.org/fhir/StructureDefinition/Holiday"' property='tmp.url' action='set' />
<assign value='"Christmas"' property='tmp.valueString' action='set' />
<comment>
<annotation>Add the extension to the primitive extension list</annotation>
</comment>
<assign value='tmp' property='target.primitiveExtension' action='set' key='1' />
<comment>
<annotation>Update the birthdate with a $listbuild with its parameters:
</annotation>
</comment>
<comment>
<annotation>The first parameter is the value in the original birthdate property. if you wish to omit the property, just send an empty string</annotation>
</comment>
<comment>
<annotation>The second parameter is the index of the required primitive extension in the list - 1.</annotation>
</comment>
<comment>
<annotation>If you wish to add more primitive extensions, just add them to the $listbuild - i.e. $listbuild(&quot;1984-12-24&quot;,1,3,4)</annotation>
</comment>
<assign value='$lb("1984-12-24",1)' property='target.birthDate' action='set' />
</transform>
}

}
