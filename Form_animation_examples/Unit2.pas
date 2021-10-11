unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, StdCtrls, shellapi, ComCtrls;

type
  TForm2 = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    StatusBar1: TStatusBar;
    procedure Label1Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Label1Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open',
    'http://www.delcode.com', nil, nil, SW_SHOWNORMAL);
end;

procedure TForm2.Label2Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open',
    'http://www.shareit.com/product.html?productid=300046697', nil, nil, SW_SHOWNORMAL);
end;

end.
