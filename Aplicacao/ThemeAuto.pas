unit ThemeAuto;

interface

uses
  System.SysUtils, System.Classes, Vcl.Forms,
  ThemeManager;

type
  TAutoTheme = class
  private
    class procedure OnAppActivate(Sender: TObject);
  public
    class procedure Activate;
  end;

implementation


class procedure TAutoTheme.OnAppActivate(Sender: TObject);
var
  I: Integer;
  F: TForm;
begin
  for I := 0 to Screen.FormCount - 1 do
  begin
    F := Screen.Forms[I];
    if Assigned(F) then
    begin
      try
        TThemeManager.ApplyDarkTheme(F);
      except

      end;
    end;
  end;
end;


class procedure TAutoTheme.Activate;
begin
  Application.OnActivate := OnAppActivate;
end;

end.

