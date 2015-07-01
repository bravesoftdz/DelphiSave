object frmEnvioMailTipoPres: TfrmEnvioMailTipoPres
  Left = 691
  Top = 208
  BorderStyle = bsSingle
  Caption = 'Env'#237'o de mails por tipo de prestador'
  ClientHeight = 200
  ClientWidth = 495
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 10
    Top = 162
    Width = 474
    Height = 2
    Shape = bsTopLine
  end
  object gbTipoPrestador: TGroupBox
    Left = 8
    Top = 8
    Width = 480
    Height = 42
    Caption = 'Tipo Prestador'
    TabOrder = 0
    inline fraTipoPres: TfraCodigoDescripcion
      Left = 5
      Top = 15
      Width = 470
      Height = 23
      TabOrder = 0
      inherited cmbDescripcion: TArtComboBox
        Width = 405
      end
    end
  end
  object gbAsunto: TGroupBox
    Left = 8
    Top = 54
    Width = 480
    Height = 48
    Caption = 'Asunto'
    TabOrder = 1
    object edAsunto: TEdit
      Left = 5
      Top = 17
      Width = 467
      Height = 21
      TabOrder = 0
    end
  end
  object gbArchivo: TGroupBox
    Left = 9
    Top = 107
    Width = 479
    Height = 45
    Caption = 'Archivo'
    TabOrder = 2
    object edArchivo: TEdit
      Left = 5
      Top = 15
      Width = 384
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 0
    end
    object btnExaminar: TButton
      Left = 395
      Top = 12
      Width = 75
      Height = 25
      Caption = 'Examinar'
      TabOrder = 1
      OnClick = btnExaminarClick
    end
  end
  object btnAceptar: TButton
    Left = 323
    Top = 168
    Width = 75
    Height = 25
    Caption = '&Aceptar'
    TabOrder = 3
    OnClick = btnAceptarClick
  end
  object btnCancelar: TButton
    Left = 407
    Top = 168
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 4
    OnClick = btnCancelarClick
  end
  object odAdjunto: TOpenDialog
    DefaultExt = 'PDF'
    InitialDir = 'c:\'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Top = 4
  end
end
