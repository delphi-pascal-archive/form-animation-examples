unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls;

type
  TForm4 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation



{$R *.dfm}

procedure TForm4.Button1Click(Sender: TObject);
begin
  close;
end;

procedure TForm4.FormCreate(Sender: TObject);

begin
  {try
    // Find handle of TASKBAR
    HTaskBar := FindWindow('Shell_TrayWnd', nil);
    // Turn SYSTEM KEYS off, Only Win 95/98/ME
    SystemParametersInfo(97, Word(True), @OldVal, 0);
    // Disable the taskbar
    EnableWindow(HTaskBar, False);
    // Hide the taskbar
    ShowWindow(HTaskbar, SW_HIDE);
  finally}
  with Form4 do
  begin
    BorderStyle := bsNone;
    FormStyle := fsStayOnTop;
    Left := 0;
    Top := 0;
    Height := Screen.Height;
    Width := Screen.Width;
  end;
end;


procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
var
  HTaskbar: HWND;
  OldVal: LongInt;
begin
  //Find handle of TASKBAR
  HTaskBar := FindWindow('Shell_TrayWnd', nil);
  //Turn SYSTEM KEYS Back ON, Only Win 95/98/ME
  SystemParametersInfo(97, Word(False), @OldVal, 0);
  //Enable the taskbar
  EnableWindow(HTaskBar, True);
  //Show the taskbar
  ShowWindow(HTaskbar, SW_SHOW);
end;

end.
