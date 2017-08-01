object mainform: Tmainform
  Left = 271
  Height = 163
  Top = 343
  Width = 446
  Caption = '1C Log Cleaner'
  ClientHeight = 163
  ClientWidth = 446
  OnCreate = FormCreate
  Position = poScreenCenter
  LCLVersion = '6.1'
  object PageControl1: TPageControl
    Left = 0
    Height = 143
    Top = 0
    Width = 446
    ActivePage = TabSheet1
    Align = alClient
    TabIndex = 0
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Чистка логов 1С'
      ClientHeight = 117
      ClientWidth = 438
      object Label1: TLabel
        Left = 0
        Height = 32
        Top = 0
        Width = 438
        Align = alTop
        AutoSize = False
        Caption = 'Выбор пользователя'
        Layout = tlCenter
        ParentColor = False
      end
      object users: TComboBox
        Left = 0
        Height = 21
        Top = 32
        Width = 438
        Align = alTop
        ItemHeight = 13
        OnChange = usersChange
        TabOrder = 0
      end
      object clean1c_btn: TButton
        Left = 0
        Height = 25
        Top = 56
        Width = 75
        Caption = 'Чистка'
        OnClick = clean1c_btnClick
        TabOrder = 1
      end
      object logoff_cb: TCheckBox
        Left = 128
        Height = 17
        Top = 64
        Width = 181
        Caption = 'Завершить сеанс пользователя'
        TabOrder = 2
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Чистка системы'
      Enabled = False
    end
    object TabSheet3: TTabSheet
      Caption = 'Настройки'
      Enabled = False
    end
  end
  object Status: TStatusBar
    Left = 0
    Height = 20
    Top = 143
    Width = 446
    Panels = <    
      item
        Text = 'Готов к работе'
        Width = 100
      end    
      item
        Width = 50
      end>
    SimplePanel = False
  end
end
