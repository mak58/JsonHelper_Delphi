program RemoveIntegerZero;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.Generics.Collections,
  Json in 'JsonRemoveInt\Json.pas';

const
  jsonString = '{' +
    '"name": "John Doe",' +
    '"idade": 0,' +
    '"document": ['+
      '{' +
        '"personID": 1101100100,'+
        '"passport": 0,' +
        '"certificate": [ ' +
          '{' +
            '"birthDocument": 0,'+
            '"marriageDocument": 14535'+
          '}'+
        ']'+
      '}'+
    ']'+
  '}';


 var
   List: TList<TArray<string>>;

begin
  try
    Writeln(jsonString);

    List := TList<TArray<string>>.Create();
    List.Add(['idade']);
    List.Add(['document', 'passport']);
    List.Add(['document', 'certificate', 'birthDocument']);

    Writeln(Json.RemoveIntegerValueFromJson(jsonString, List));
    System.Readln;
  finally
    List.Free;
  end;
end.
