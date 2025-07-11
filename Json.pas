unit Json;

interface

uses
  System.JSON, System.Generics.Collections;

function RemoveIntegerValueFromJson(AJsonString: string;
  AList: TList<TArray<string>>): string;

implementation

function RemoveIntegerValueFromJson(AJsonString: string;
  AList: TList<TArray<string>>): string;
var
  indexList, CountArrayMax, indexArrayString: Byte;
  JSON_Array: TJSONArray;
  Json, JSON_Aux: TJSONObject;
  arrayFieldsJSON: TArray<string>;

//  List.Add(['idade']);
//  List.Add(['document', 'passport']);
//  List.Add(['document', 'certificate', 'birthDocument']);

  {
   'name': 'John Doe',
   'idade': 0,
   'document':
     [ 'personID': '1101100100',
       'passport' : 0,
       'certificate':
         [  'birthDocument': 0,
            'marriageDocument': 14535
         ]
     ]
 }
begin
  Json := TJSONObject.ParseJSONValue(AJsonString) as TJSONObject;

  if Assigned(Json) and (Assigned(AList)) and (AList.Count > 0) then
  begin
    for indexList := 0 to AList.Count -1 do
    begin
      arrayFieldsJSON := AList[indexList];
      CountArrayMax := Length(arrayFieldsJSON);

      indexArrayString := 0;
      if (arrayFieldsJSON[indexArrayString] <> '') then
      begin
        repeat
          if ((indexArrayString + 1) = CountArrayMax) then
          begin
            if indexArrayString = 0 then
              Json.RemovePair(arrayFieldsJSON[indexArrayString])
            else
              JSON_Aux.RemovePair(arrayFieldsJSON[indexArrayString]);
          end
          else
          begin
            if indexArrayString = 0 then
              Json.TryGetValue<TJSONArray>(arrayFieldsJSON[indexArrayString], JSON_Array)
            else
              JSON_Aux.TryGetValue<TJSONArray>(arrayFieldsJSON[indexArrayString], JSON_Array);

            if Assigned(JSON_Array) then
              JSON_Aux := JSON_Array.Items[0] as TJSONObject;
          end;
          Inc(indexArrayString);
        until (indexArrayString = CountArrayMax);
      end;
    end;
  end;
  Result := Json.ToString();
end;

end.




