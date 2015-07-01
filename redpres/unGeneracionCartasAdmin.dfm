inherited frmGeneracionCartasAdmin: TfrmGeneracionCartasAdmin
  Left = 261
  Top = 130
  Width = 746
  Caption = 'Administraci'#243'n de Cartas Documento'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Splitter1: TSplitter
    Top = 274
    Width = 736
    Height = 4
  end
  inherited pnlInferior: TPanel
    Top = 278
    Width = 736
    Height = 243
    inherited Bevel2: TBevel
      Left = 5
      Top = 211
      Width = 729
    end
    inherited Bevel1: TBevel
      Left = 653
      Top = 218
    end
    inherited fraToolbarRTF: TfraToolbarRTF
      Width = 736
      inherited tBarRTF: TToolBar
        Width = 736
        inherited tbGuardar: TToolButton
          OnClick = fraToolbarRTFtbGuardarClick
        end
      end
    end
    inherited edTexto: TRxRichEdit
      Left = 1
      Top = 29
      Width = 735
      Height = 176
      ScrollBars = ssVertical
    end
    inherited btnImprimir: TButton
      Left = 495
      Top = 219
      Visible = False
    end
    inherited btnAceptar: TButton
      Left = 574
      Top = 219
    end
    inherited btnCancelar: TButton
      Left = 660
      Top = 219
    end
    object ToolBar1: TToolBar
      Left = 4
      Top = 217
      Width = 27
      Height = 29
      Align = alNone
      Anchors = [akLeft, akBottom]
      ButtonHeight = 24
      ButtonWidth = 25
      Caption = 'ToolBar1'
      EdgeInner = esNone
      EdgeOuter = esNone
      Images = frmPrincipal.ilColor
      TabOrder = 5
      object tbModifDomic: TToolButton
        Left = 0
        Top = 2
        Hint = 'Modificar domicilio de la carta'
        ImageIndex = 28
        ParentShowHint = False
        ShowHint = True
        OnClick = tbModifDomicClick
      end
    end
  end
  inherited pnlSuperior: TPanel
    Width = 736
    Height = 274
    Anchors = [akLeft, akTop, akRight, akBottom]
    Constraints.MaxHeight = 390
    Constraints.MinHeight = 211
    inherited Panel1: TPanel
      Top = 119
      Width = 736
      Height = 155
      inherited Label7: TLabel
        Left = 3
        Top = 24
      end
      inherited edObservaciones: TMemo
        Left = 53
        Top = 24
        Width = 683
        Height = 126
        ScrollBars = ssVertical
      end
      object chkSerolOdont: TCheckBox
        Left = 52
        Top = 2
        Width = 217
        Height = 17
        Caption = 'Notificaci'#243'n por serolog'#237'a u odontolog'#237'a'
        TabOrder = 1
      end
    end
    inherited pnlDatos: TPanel
      Top = 47
      Width = 736
      Height = 72
      DesignSize = (
        736
        72)
      inherited Label2: TLabel
        Left = 5
      end
      inherited Label3: TLabel
        Top = 4
      end
      inherited Label4: TLabel
        Left = 0
        Top = 30
      end
      inherited Label5: TLabel
        Top = 31
      end
      inherited Label6: TLabel
        Left = 2
        Top = 54
      end
      inherited Label10: TLabel
        Left = 334
        Top = 55
      end
      inherited fraCtbTablasCorreo: TfraStaticCTB_TABLAS
        Left = 52
        Top = 48
        inherited cmbDescripcion: TComboGrid
          Cells = (
            'C'#243'digo'
            'Descripci'#243'n'
            'Id'
            'Fecha de Baja'
            'TB_CLAVE'
            'TB_ESPECIAL1')
          ColWidths = (
            40
            300
            -1
            -1
            -1
            -1)
        end
      end
      inherited fraCtbTablasTipoSalida: TfraStaticCTB_TABLAS
        Left = 386
        Top = 24
        Width = 352
        inherited cmbDescripcion: TComboGrid
          Width = 288
          Cells = (
            'C'#243'digo'
            'Descripci'#243'n'
            'Id'
            'Fecha de Baja'
            'TB_CLAVE'
            'TB_ESPECIAL1')
          ColWidths = (
            40
            300
            -1
            -1
            -1
            -1)
        end
      end
      inherited fraCodigoModulo: TfraStaticCodigoDescripcion
        Left = 52
        Width = 271
        OnExit = fraCodigoModuloExit
        inherited cmbDescripcion: TComboGrid
          Width = 209
          Cells = (
            'C'#243'digo'
            'Descripci'#243'n'
            'Id'
            'Fecha de Baja')
          ColWidths = (
            40
            300
            -1
            -1)
        end
      end
      inherited fraCodigoCodFirmante: TfraStaticCodigoDescripcion
        Left = 52
        Top = 24
        inherited cmbDescripcion: TComboGrid
          Width = 209
          Cells = (
            'C'#243'digo'
            'Descripci'#243'n'
            'Id'
            'Fecha de Baja')
          ColWidths = (
            40
            300
            -1
            -1)
        end
      end
      inherited fraARTs: TfraStaticCodigoDescripcion
        Left = 385
        Top = 48
        Width = 352
        inherited cmbDescripcion: TComboGrid
          Width = 289
          Cells = (
            'C'#243'digo'
            'Descripci'#243'n'
            'Id'
            'Fecha de Baja')
          ColWidths = (
            40
            300
            -1
            -1)
        end
      end
      inherited fraCodigoCodTexto: TfraCodigoDescripcion
        Left = 386
        Width = 352
        inherited cmbDescripcion: TArtComboBox
          Width = 288
        end
      end
    end
    inherited pnlAdicional: TPanel
      Width = 736
      Height = 47
      DesignSize = (
        736
        47)
      object gbEmpresa: TGroupBox
        Left = 1
        Top = -2
        Width = 735
        Height = 43
        Anchors = [akLeft, akTop, akRight]
        Caption = '&Empresa'
        TabOrder = 0
        DesignSize = (
          735
          43)
        object Label9: TLabel
          Left = 24
          Top = 20
          Width = 25
          Height = 13
          Caption = 'CUIT'
        end
        inline fraEmpresa: TfraEmpresa
          Left = 56
          Top = 16
          Width = 675
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
          DesignSize = (
            675
            21)
          inherited lbContrato: TLabel
            Left = 571
          end
          inherited edContrato: TIntEdit
            Left = 616
          end
          inherited cmbRSocial: TArtComboBox
            Width = 436
          end
        end
      end
      object gbTrabajador: TGroupBox
        Left = 1
        Top = 0
        Width = 735
        Height = 41
        Anchors = [akLeft, akTop, akRight]
        Caption = '&Trabajador'
        TabOrder = 1
        DesignSize = (
          735
          41)
        object Label8: TLabel
          Left = 28
          Top = 20
          Width = 24
          Height = 13
          Caption = 'CUIL'
        end
        inline fraTrabajador: TfraTrabajador
          Left = 56
          Top = 17
          Width = 676
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          DesignSize = (
            676
            21)
          inherited cmbNombre: TArtComboBox
            Width = 590
          end
        end
      end
      object gbSiniestro: TGroupBox
        Left = 0
        Top = 0
        Width = 738
        Height = 43
        Anchors = [akLeft, akTop, akRight]
        Caption = '&Siniestro'
        TabOrder = 2
        DesignSize = (
          738
          43)
        object Label42: TLabel
          Left = 198
          Top = 17
          Width = 51
          Height = 13
          Caption = 'Trabajador'
        end
        object Label1: TLabel
          Left = 8
          Top = 17
          Width = 61
          Height = 13
          Caption = 'Nro. siniestro'
        end
        object edSiniestro: TSinEdit
          Left = 76
          Top = 14
          Width = 113
          Height = 21
          OnExit = edSiniestroExit
          TabOrder = 0
          OnSelect = edSiniestroExit
          AutoExit = True
        end
        object edTrabajador: TEdit
          Left = 256
          Top = 14
          Width = 473
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 1
        end
      end
    end
  end
  object fpCambiarDomicilioCarta: TFormPanel [3]
    Left = 56
    Top = 440
    Width = 650
    Height = 205
    Caption = 'Modificar domicilio de la Carta'
    FormWidth = 0
    FormHeigth = 0
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    DesignSize = (
      650
      205)
    object btnAceptarDom: TButton
      Left = 489
      Top = 177
      Width = 75
      Height = 23
      Anchors = [akTop, akRight]
      Caption = 'Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnAceptarDomClick
    end
    object btnCancelarDom: TButton
      Left = 568
      Top = 177
      Width = 75
      Height = 23
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Cancelar'
      ModalResult = 2
      TabOrder = 1
      OnClick = btnCancelarDomClick
    end
    object pnlDestinatario: TPanel
      Left = 2
      Top = 1
      Width = 647
      Height = 109
      BevelOuter = bvNone
      TabOrder = 2
      object lblDestinatario: TLabel
        Left = 3
        Top = 9
        Width = 59
        Height = 13
        Caption = 'Destinatario:'
      end
      object Label11: TLabel
        Left = 312
        Top = 9
        Width = 151
        Height = 13
        Caption = 'Destinatario original de la carta: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblDestiOriginal: TLabel
        Left = 463
        Top = 9
        Width = 21
        Height = 13
        Caption = '       '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      inline fraDestinatario: TfraCtbTablas
        Left = 64
        Top = 4
        Width = 233
        Height = 23
        TabOrder = 0
        DesignSize = (
          233
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 180
        end
      end
      object pnlDestNombre: TPanel
        Left = 1
        Top = 31
        Width = 644
        Height = 33
        BevelInner = bvSpace
        BevelOuter = bvLowered
        TabOrder = 1
        object lOtroNombre: TLabel
          Left = 13
          Top = 10
          Width = 40
          Height = 13
          Caption = 'Nombre:'
        end
        object edNombre: TEdit
          Left = 63
          Top = 7
          Width = 575
          Height = 21
          TabOrder = 0
        end
      end
      object pnlPrestador: TPanel
        Left = 1
        Top = 66
        Width = 644
        Height = 33
        BevelInner = bvSpace
        BevelOuter = bvLowered
        TabOrder = 2
        object lblPrestador: TLabel
          Left = 8
          Top = 12
          Width = 48
          Height = 13
          Caption = 'Prestador:'
        end
        inline fraPrestador: TfraPrestador
          Left = 61
          Top = 4
          Width = 579
          Height = 27
          VertScrollBar.Range = 49
          AutoScroll = False
          TabOrder = 0
          DesignSize = (
            563
            27)
          inherited lbCPostal: TLabel
            Left = 491
          end
          inherited lbTelefono: TLabel
            Left = 403
          end
          inherited cmbPrestFantasia: TArtComboBox
            Width = 108
          end
          inherited cmbPrestador: TArtComboBox
            Width = 233
          end
          inherited edPresLocalidad: TEdit
            Width = 137
          end
          inherited edPresCPostal: TEdit
            Left = 508
          end
          inherited edPresTelefono: TEdit
            Left = 404
          end
        end
      end
    end
    object Panel3: TPanel
      Left = 3
      Top = 108
      Width = 644
      Height = 65
      BevelInner = bvSpace
      BevelOuter = bvLowered
      TabOrder = 3
      DesignSize = (
        644
        65)
      inline fraDomicilio: TfraDomicilio
        Left = 3
        Top = 8
        Width = 636
        Height = 52
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        DesignSize = (
          636
          52)
        inherited lbNro: TLabel
          Left = 421
        end
        inherited lbPiso: TLabel
          Left = 493
        end
        inherited lbDto: TLabel
          Left = 569
        end
        inherited lbProvincia: TLabel
          Left = 474
        end
        inherited cmbCalle: TArtComboBox
          Width = 336
        end
        inherited edNumero: TEdit
          Left = 443
        end
        inherited edPiso: TEdit
          Left = 519
        end
        inherited edDto: TEdit
          Left = 591
        end
        inherited cmbLocalidad: TArtComboBox
          Width = 204
        end
        inherited edProvincia: TEdit
          Left = 523
        end
        inherited btnBuscar: TButton
          Left = 386
        end
      end
    end
  end
  inherited Seguridad1: TSeguridad
    Claves = <
      item
        Name = 'CambiarFirmante'
      end>
    Left = 28
    Top = 355
  end
  inherited FormPlacement: TFormPlacement
    Left = 56
    Top = 355
  end
  inherited sdqDatos: TSDQuery
    Left = 28
    Top = 382
  end
  inherited sduDatos: TSDUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO CCA_CARTA'
      '(CA_ID, CA_IDTEXTOCARTA, CA_CORREO, CA_TIPOSALIDA, CA_IDFIRMA,'
      
        ' CA_OBSERVACIONES, CA_IDFORMULARIO, CA_IDENDOSO, CA_IDEMPDEUDORA' +
        ', CA_MANUAL,'
      
        ' CA_TEXTOFINAL, CA_IDDELEGACION, CA_IDAREATEXTO, CA_USUALTA, CA_' +
        'FECHAALTA,'
      
        ' CA_IDEXPEDIENTE, CA_IDTRABAJADOR, CA_IDART, CA_IDDESTINATARIOCA' +
        'RTA, CA_MARCAGRUPOMIXTO)'
      'VALUES'
      
        '(:CA_ID, :CA_IDTEXTOCARTA, :CA_CORREO, :CA_TIPOSALIDA, :CA_IDFIR' +
        'MA,'
      
        ' :CA_OBSERVACIONES, :CA_IDFORMULARIO, :CA_IDENDOSO, :CA_IDEMPDEU' +
        'DORA, :CA_MANUAL,'
      
        ' :CA_TEXTOFINAL, :CA_IDDELEGACION, :CA_IDAREATEXTO, :CA_USUALTA,' +
        ' ACTUALDATE,'
      
        ' :CA_IDEXPEDIENTE, :CA_IDTRABAJADOR, :CA_IDART, :CA_IDDESTINATAR' +
        'IOCARTA, :CA_MARCAGRUPOMIXTO)')
    Left = 56
    Top = 382
  end
end
