object frmMoverEstudio: TfrmMoverEstudio
  Left = 255
  Top = 274
  Width = 563
  Height = 252
  BorderIcons = [biSystemMenu]
  Caption = 'Mover Estudio'
  Color = clBtnFace
  Constraints.MaxHeight = 252
  Constraints.MinHeight = 252
  Constraints.MinWidth = 500
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  DesignSize = (
    555
    225)
  PixelsPerInch = 96
  TextHeight = 13
  object pnlDatos: TPanel
    Left = 4
    Top = 4
    Width = 548
    Height = 194
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      548
      194)
    object Bevel1: TBevel
      Left = 4
      Top = 34
      Width = 539
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Bevel2: TBevel
      Left = 4
      Top = 91
      Width = 539
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Bevel3: TBevel
      Left = 4
      Top = 124
      Width = 539
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Label1: TLabel
      Left = 8
      Top = 136
      Width = 35
      Height = 13
      Caption = 'Estudio'
    end
    object Label2: TLabel
      Left = 8
      Top = 168
      Width = 30
      Height = 13
      Caption = 'Fecha'
    end
    object Bevel4: TBevel
      Left = 4
      Top = 158
      Width = 539
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Label3: TLabel
      Left = 8
      Top = 102
      Width = 51
      Height = 13
      Caption = 'Trabajador'
    end
    inline fraEstablecimiento: TfraEstablecimiento_OLD
      Left = 2
      Top = 41
      Width = 542
      Height = 47
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      inherited lbLocalidad: TLabel
        Left = 308
      end
      inherited lbCPostal: TLabel
        Left = 471
      end
      inherited lbProvincia: TLabel
        Left = 308
      end
      inherited cmbDescripcion: TArtComboBox
        Width = 221
      end
      inherited edLocalidad: TEdit
        Left = 360
      end
      inherited edCPostal: TEdit
        Left = 495
      end
      inherited edDomicilio: TEdit
        Width = 251
      end
      inherited edProvincia: TEdit
        Left = 360
      end
    end
    inline fraEstudio: TfraEstudio
      Left = 56
      Top = 132
      Width = 487
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      inherited cmbDescripcion: TArtComboBox
        Width = 411
      end
    end
    object edFecha: TDateComboBox
      Left = 56
      Top = 165
      Width = 88
      Height = 21
      MinDate = 35065.000000000000000000
      TabOrder = 4
      OnExit = edFechaExit
    end
    object edFechaText: TEdit
      Left = 145
      Top = 165
      Width = 398
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 5
    end
    inline fraEmpresa: TfraEmpresa
      Left = 6
      Top = 6
      Width = 535
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      inherited lbContrato: TLabel
        Left = 433
      end
      inherited edContrato: TIntEdit
        Left = 478
      end
      inherited cmbRSocial: TArtComboBox
        Width = 296
      end
    end
    inline fraTrabajador: TfraTrabajador
      Left = 64
      Top = 99
      Width = 479
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      inherited cmbNombre: TArtComboBox
        Width = 395
      end
    end
  end
  object btnAceptar: TButton
    Left = 399
    Top = 200
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Aceptar'
    TabOrder = 1
    OnClick = btnAceptarClick
  end
  object btnCancelar: TButton
    Left = 477
    Top = 200
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 2
  end
end
