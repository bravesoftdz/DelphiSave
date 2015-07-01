object frmImportarInformeDirectorios: TfrmImportarInformeDirectorios
  Left = 580
  Top = 271
  BorderStyle = bsDialog
  Caption = 'Directorios'
  ClientHeight = 196
  ClientWidth = 489
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    489
    196)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel2: TBevel
    Left = 7
    Top = 145
    Width = 470
    Height = 7
    Anchors = [akLeft, akRight, akBottom]
    Shape = bsTopLine
  end
  object Label1: TLabel
    Left = 7
    Top = 8
    Width = 39
    Height = 13
    Caption = 'Origen :'
  end
  object Label2: TLabel
    Left = 8
    Top = 67
    Width = 98
    Height = 13
    Caption = 'Destino : File-Server'
  end
  object Label3: TLabel
    Left = 7
    Top = 112
    Width = 43
    Height = 13
    Caption = 'Periodo :'
  end
  object btnCancelar: TButton
    Left = 408
    Top = 163
    Width = 73
    Height = 25
    Action = acCancelar
    ModalResult = 2
    TabOrder = 4
  end
  object btnProcesar: TButton
    Left = 329
    Top = 163
    Width = 73
    Height = 25
    Action = acProcesar
    TabOrder = 3
  end
  object edOrigenDir: TEdit
    Left = 7
    Top = 24
    Width = 434
    Height = 21
    Color = clInactiveCaption
    ReadOnly = True
    TabOrder = 0
  end
  object btBuscarOrigen: TButton
    Left = 447
    Top = 22
    Width = 31
    Height = 25
    Action = acBuscarOrigen
    TabOrder = 1
  end
  object edMaskPeriodo: TPeriodoPicker
    Left = 56
    Top = 108
    Width = 57
    Height = 21
    TabOrder = 2
    Color = clWindow
    Periodo.AllowNull = False
    Periodo.Orden = poAnoMes
    Periodo.Separador = #0
    Periodo.Mes = 1
    Periodo.Ano = 2014
    Periodo.Valor = '201401'
    Periodo.MaxPeriodo = '206401'
    Periodo.MinPeriodo = '196402'
    WidthMes = 19
    Separation = 0
    ShowButton = False
    ShowOrder = poAnoMes
    ReadOnly = False
    Enabled = True
    Fuente.Charset = DEFAULT_CHARSET
    Fuente.Color = clWindowText
    Fuente.Height = -11
    Fuente.Name = 'Tahoma'
    Fuente.Style = []
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    NullDropDown = SetMax
  end
  object ActionList1: TActionList
    Left = 168
    Top = 144
    object acBuscarOrigen: TAction
      Category = 'SetDirectorios'
      Caption = '...'
      OnExecute = acBuscarOrigenExecute
    end
    object acBuscarDestino: TAction
      Category = 'SetDirectorios'
      Caption = '...'
      Visible = False
      OnExecute = acBuscarDestinoExecute
    end
    object acCancelar: TAction
      Category = 'SetDirectorios'
      Caption = 'Cancelar'
      OnExecute = acCancelarExecute
    end
    object acProcesar: TAction
      Category = 'SetDirectorios'
      Caption = 'Procesar'
      OnExecute = acProcesarExecute
    end
  end
  object fdSelectDir: TFolderDialog
    Caption = 'Seleccione Directorio'
    DialogX = 0
    DialogY = 0
    Version = '1.1.0.1'
    Left = 112
    Top = 144
  end
end
