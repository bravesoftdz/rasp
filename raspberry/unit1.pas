unit Unit1; 

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, mysql50conn, FileUtil, Forms, Controls, Graphics, Dialogs,
  StdCtrls, ExtCtrls, IpHtml, httpsend;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    edtGamma: TEdit;
    Memo1: TMemo;
    tmrPC: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure tmrPCTimer(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  Form1: TForm1;
  fGamma:text;

implementation

{$R *.lfm}

{ TForm1 }

function HTTPPost(const URL, URLData:string; const Data:TStream):boolean;
var http:THTTPSend;
begin
     http:=THTTPSend.Create;
     try
        http.document.write(Pointer(URLData)^,Length(URLData));
        result:=HTTP.HTTPMethod('POST',URL);
     finally
       http.free;
     end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
    try
      tmrPC.enabled:=true;
      assignFile(fGamma,edtGamma.text);reset(fGamma);
      memo1.lines.add('Connected to '+edtGamma.text);
    except
      memo1.lines.add('Failed to connect to '+edtGamma.text);
    end;
end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
    try
     CloseFile(fGamma);

    except
    end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
end;

procedure TForm1.tmrPCTimer(Sender: TObject);
var s:string;
    dez,res:string;
    Data:TStream;
begin
     readln(fGamma,s);
     if s<>'' then begin
       // # 32 dez/1s<LF>CR>
       memo1.lines.add('Geiger received: '+s);
       try
              while (s<>'') and (s[1]<>'#') do delete(s,1,1);
              while (s<>'') and ((s[1]='#') or (s[1]=' ')) do delete(s,1,1);
              dez:=copy(s,1,pos(' ',s)-1);
              delete(s,1,pos('/',s));
              while(s<>'') and (s[1]=' ') do delete(s,1,1);
              res:=copy(s,1,pos('s',s)-1);
              s:='http://hackathon.capel.ro/submit_dez.php?dez='+dez+'&res='+res;
              //memo1.lines.add(s);
              HTTPPost(s,'',Data);
       finally
       end;
     end;

end;

end.

