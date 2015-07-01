inherited fraDigitalizacion: TfraDigitalizacion
  Width = 496
  Height = 121
  Constraints.MinWidth = 496
  Font.Name = 'Tahoma'
  ParentFont = False
  DesignSize = (
    496
    121)
  object Label14: TLabel
    Left = 80
    Top = 20
    Width = 37
    Height = 13
    Caption = 'Label14'
  end
  object pgArchivos: TJvPageControl
    Left = 0
    Top = 0
    Width = 496
    Height = 121
    ActivePage = tsCDInca
    Anchors = [akLeft, akTop, akRight, akBottom]
    Style = tsButtons
    TabOrder = 0
    TabStop = False
    HandleGlobalTab = True
    ReduceMemoryUse = True
    object tsAfiliaciones: TTabSheet
      Caption = 'Afiliaciones'
      ImageIndex = 1
      object Label5: TLabel
        Left = 18
        Top = 8
        Width = 24
        Height = 13
        Alignment = taRightJustify
        Caption = 'CUIT'
      end
      inline fraEmpresaAFI: TfraEmpresa
        Left = 48
        Top = 4
        Width = 437
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        inherited lbContrato: TLabel
          Left = 335
        end
        inherited edContrato: TIntEdit
          Left = 380
        end
        inherited cmbRSocial: TArtComboBox
          Width = 198
        end
      end
    end
    object tsCD: TTabSheet
      Caption = 'Cartas Documento'
      ImageIndex = 4
      object Label10: TLabel
        Left = 23
        Top = 8
        Width = 27
        Height = 13
        Alignment = taRightJustify
        Caption = 'Carta'
      end
      object Label11: TLabel
        Left = 143
        Top = 8
        Width = 41
        Height = 13
        Alignment = taRightJustify
        Caption = 'Siniestro'
      end
      object Label12: TLabel
        Left = 27
        Top = 36
        Width = 24
        Height = 13
        Alignment = taRightJustify
        Caption = 'CUIT'
      end
      object Label13: TLabel
        Left = 290
        Top = 8
        Width = 23
        Height = 13
        Alignment = taRightJustify
        Caption = #193'rea'
      end
      object Label15: TLabel
        Left = 1
        Top = 64
        Width = 53
        Height = 13
        Alignment = taRightJustify
        Caption = 'Trabajador'
      end
      object edSiniestroCARTA: TSinEdit
        Left = 185
        Top = 4
        Width = 100
        Height = 21
        TabOrder = 1
        OnSelect = edSiniestroCARTASelect
      end
      inline fraEmpresaCARTA: TfraEmpresa
        Left = 55
        Top = 32
        Width = 424
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        DesignSize = (
          424
          21)
        inherited lbContrato: TLabel
          Left = 320
        end
        inherited edContrato: TIntEdit
          Left = 367
        end
        inherited cmbRSocial: TArtComboBox
          Width = 182
        end
      end
      inline fraAreaCARTA: TfraCtbTablas
        Left = 316
        Top = 4
        Width = 163
        Height = 23
        TabOrder = 3
        DesignSize = (
          163
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 110
        end
      end
      inline fraTrabajadorCARTA: TfraTrabajador
        Left = 55
        Top = 60
        Width = 424
        Height = 21
        TabOrder = 4
        DesignSize = (
          424
          21)
        inherited cmbNombre: TArtComboBox
          Width = 341
        end
      end
      object edCarta: TPatternEdit
        Left = 55
        Top = 4
        Width = 84
        Height = 21
        MaxLength = 13
        TabOrder = 0
        OnChange = OnPrivateChange
        Pattern = '0123456789'
      end
    end
    object tsCDInca: TTabSheet
      Caption = 'Cartas Incapacidades'
      ImageIndex = 12
      object Label28: TLabel
        Left = 23
        Top = 8
        Width = 27
        Height = 13
        Alignment = taRightJustify
        Caption = 'Carta'
      end
      object Label29: TLabel
        Left = 143
        Top = 8
        Width = 41
        Height = 13
        Alignment = taRightJustify
        Caption = 'Siniestro'
      end
      object Label30: TLabel
        Left = 27
        Top = 36
        Width = 24
        Height = 13
        Alignment = taRightJustify
        Caption = 'CUIT'
      end
      object Label31: TLabel
        Left = 290
        Top = 8
        Width = 23
        Height = 13
        Alignment = taRightJustify
        Caption = #193'rea'
      end
      object Label32: TLabel
        Left = 1
        Top = 64
        Width = 53
        Height = 13
        Alignment = taRightJustify
        Caption = 'Trabajador'
      end
      object edSiniestroCARTAINCA: TSinEdit
        Left = 185
        Top = 4
        Width = 100
        Height = 21
        TabOrder = 0
        OnSelect = edSiniestroCARTAINCASelect
      end
      inline fraEmpresaCARTAINCA: TfraEmpresa
        Left = 55
        Top = 32
        Width = 424
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        DesignSize = (
          424
          21)
        inherited lbContrato: TLabel
          Left = 320
        end
        inherited edContrato: TIntEdit
          Left = 367
        end
        inherited cmbRSocial: TArtComboBox
          Width = 185
        end
      end
      inline fraAreaCARTAINCA: TfraCtbTablas
        Left = 316
        Top = 4
        Width = 163
        Height = 23
        TabOrder = 2
        DesignSize = (
          163
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 110
        end
      end
      inline fraTrabajadorCARTAINCA: TfraTrabajador
        Left = 55
        Top = 60
        Width = 424
        Height = 21
        TabOrder = 3
        DesignSize = (
          424
          21)
        inherited cmbNombre: TArtComboBox
          Width = 340
        end
      end
      object edCartaINCA: TPatternEdit
        Left = 55
        Top = 4
        Width = 84
        Height = 21
        MaxLength = 13
        TabOrder = 4
        OnChange = OnPrivateChange
        Pattern = '0123456789'
      end
    end
    object tsComercializacion: TTabSheet
      Caption = 'Comercializacion'
      ImageIndex = 8
      inline fraEntidadCUIT: TfraEntidadCUIT
        Left = 8
        Top = 4
        Width = 473
        Height = 24
        TabOrder = 0
        inherited lbRSocial: TLabel
          Left = 0
          Width = 24
          Caption = 'CUIT'
          Font.Name = 'Tahoma'
        end
        inherited Label3: TLabel
          Width = 59
        end
        inherited cmbDescripcion: TArtComboBox
          Width = 216
        end
      end
      inline fraVendedoresCUIT: TfraVendedoresCUIT
        Left = 8
        Top = 32
        Width = 473
        Height = 24
        TabOrder = 1
        inherited lbRSocial: TLabel
          Left = 0
          Width = 24
          Caption = 'CUIT'
        end
        inherited cmbDescripcion: TArtComboBox
          Width = 200
        end
      end
    end
    object tsContratos: TTabSheet
      Caption = 'Contratos'
      ImageIndex = 10
      object LabelCONTRATO2: TLabel
        Left = 28
        Top = 36
        Width = 31
        Height = 13
        Caption = 'Sector'
      end
      object LabelCONTRATO1: TLabel
        Left = 8
        Top = 8
        Width = 50
        Height = 13
        Caption = 'Proveedor'
      end
      inline fraSectorCONTRATOS: TfraCodDesc
        Left = 64
        Top = 32
        Width = 417
        Height = 23
        TabOrder = 0
        inherited cmbDescripcion: TArtComboBox
          Width = 352
        end
        inherited Propiedades: TPropiedadesFrame
          FieldBaja = 'NULL'
          FieldCodigo = 'SC_DESCRIPCION'
          FieldDesc = 'SC_DESCRIPCION'
          FieldID = 'SC_DESCRIPCION'
          OrderBy = 'SC_DESCRIPCION'
          ShowBajas = True
          TableName = 'BANK.BSC_SECTOR'
        end
      end
      inline fraProveedorCONTRATOS: TfraCodDesc
        Left = 64
        Top = 4
        Width = 417
        Height = 23
        TabOrder = 1
        inherited cmbDescripcion: TArtComboBox
          Width = 352
        end
        inherited Propiedades: TPropiedadesFrame
          Sql = 
            ' SELECT DISTINCT segment1 AS id, segment1 AS codigo, vendor_name' +
            ' AS descripcion, DECODE(enabled_flag, '#39'Y'#39', NULL, SYSDATE) AS baj' +
            'a FROM bank.scancont, po_vendors@realfcl WHERE fd_legajo = segme' +
            'nt1 '
        end
      end
    end
    object tsHyS: TTabSheet
      Caption = 'Higiene y Seguridad'
      ImageIndex = 2
      object Label3: TLabel
        Left = 48
        Top = 8
        Width = 24
        Height = 13
        Alignment = taRightJustify
        Caption = 'CUIT'
      end
      object Label4: TLabel
        Left = 20
        Top = 60
        Width = 54
        Height = 13
        Caption = 'Documento'
      end
      object Label6: TLabel
        Left = 1
        Top = 35
        Width = 74
        Height = 13
        Alignment = taRightJustify
        Caption = 'Establecimiento'
      end
      inline fraEmpresaHYS: TfraEmpresa
        Left = 76
        Top = 4
        Width = 401
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        inherited lbContrato: TLabel
          Left = 299
        end
        inherited edContrato: TIntEdit
          Left = 344
        end
        inherited cmbRSocial: TArtComboBox
          Width = 165
        end
      end
      inline fraRTD_TIPODOCUMENTO_HYS: TfraRTD_TIPODOCUMENTO
        Left = 77
        Top = 56
        Width = 403
        Height = 24
        TabOrder = 1
        DesignSize = (
          403
          24)
        inherited cmbDescripcion: TArtComboBox
          Width = 338
        end
        inherited edCodigo: TPatternEdit
          Left = 0
          Width = 61
        end
        inherited Propiedades: TPropiedadesFrame
          ExtraCondition = ' AND TD_SECTOR = '#39'HYS'#39' '
          ShowBajas = True
        end
      end
    end
    object tsIncapacidades: TTabSheet
      Caption = 'Incapacidades'
      ImageIndex = 11
      object Label24: TLabel
        Left = 12
        Top = 8
        Width = 41
        Height = 13
        Alignment = taRightJustify
        Caption = 'Siniestro'
      end
      object Label25: TLabel
        Left = 164
        Top = 8
        Width = 54
        Height = 13
        Caption = 'Documento'
      end
      object Label26: TLabel
        Left = 26
        Top = 36
        Width = 24
        Height = 13
        Alignment = taRightJustify
        Caption = 'CUIT'
      end
      object Label27: TLabel
        Left = 1
        Top = 64
        Width = 53
        Height = 13
        Alignment = taRightJustify
        Caption = 'Trabajador'
      end
      object edSiniestroINCA: TSinEdit
        Left = 56
        Top = 4
        Width = 100
        Height = 21
        TabOrder = 0
        OnSelect = edSiniestroINCASelect
      end
      inline fraRTD_TIPODOCUMENTO_INCA: TfraRTD_TIPODOCUMENTO
        Left = 220
        Top = 3
        Width = 263
        Height = 24
        TabOrder = 1
        DesignSize = (
          263
          24)
        inherited cmbDescripcion: TArtComboBox
          Width = 198
        end
        inherited Propiedades: TPropiedadesFrame
          ExtraCondition = ' AND TD_SECTOR = '#39'ARCHSIN'#39' '
          ShowBajas = True
        end
      end
      inline fraEmpresaINCA: TfraEmpresa
        Left = 56
        Top = 32
        Width = 425
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        inherited lbContrato: TLabel
          Left = 321
        end
        inherited edContrato: TIntEdit
          Left = 368
        end
        inherited cmbRSocial: TArtComboBox
          Width = 186
        end
      end
      inline fraTrabajadorINCA: TfraTrabajador
        Left = 56
        Top = 60
        Width = 431
        Height = 21
        TabOrder = 3
        inherited cmbNombre: TArtComboBox
          Width = 347
        end
      end
    end
    object tsJuicios: TTabSheet
      Caption = 'Juicios'
      ImageIndex = 7
    end
    object tsMedLab: TTabSheet
      Caption = 'Medicina Laboral'
      ImageIndex = 3
      object Label8: TLabel
        Left = 13
        Top = 8
        Width = 39
        Height = 13
        Alignment = taRightJustify
        Caption = 'Carpeta'
      end
      object Label7: TLabel
        Left = 28
        Top = 36
        Width = 24
        Height = 13
        Alignment = taRightJustify
        Caption = 'CUIT'
      end
      object Label9: TLabel
        Left = 1
        Top = 62
        Width = 53
        Height = 13
        Alignment = taRightJustify
        Caption = 'Trabajador'
      end
      object edCarpeta: TIntEdit
        Left = 56
        Top = 4
        Width = 57
        Height = 21
        TabOrder = 0
        OnChange = OnPrivateChange
      end
      inline fraEmpresaLABO: TfraEmpresa
        Left = 56
        Top = 32
        Width = 430
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        DesignSize = (
          430
          21)
        inherited lbContrato: TLabel
          Left = 326
        end
        inherited edContrato: TIntEdit
          Left = 373
        end
        inherited cmbRSocial: TArtComboBox
          Width = 190
        end
      end
      inline fraTrabajadorLABO: TfraTrabajador
        Left = 56
        Top = 59
        Width = 431
        Height = 21
        TabOrder = 2
        DesignSize = (
          431
          21)
        inherited cmbNombre: TArtComboBox
          Width = 349
        end
      end
    end
    object tsPrestadores: TTabSheet
      Caption = 'Prestadores'
      ImageIndex = 5
      inline fraPrestador: TfraCPR_PRESTADOR
        Left = 5
        Top = 4
        Width = 480
        Height = 53
        VertScrollBar.Range = 49
        AutoScroll = False
        TabOrder = 0
        inherited lbCUIT: TLabel
          Width = 24
        end
        inherited lbSec: TLabel
          Width = 21
        end
        inherited lbIdentif: TLabel
          Width = 40
        end
        inherited lbRSocial: TLabel
          Width = 38
        end
        inherited lbDomicilio: TLabel
          Top = 32
          Width = 40
        end
        inherited lbLocalidad: TLabel
          Left = 264
          Top = 32
          Width = 44
        end
        inherited lbCPostal: TLabel
          Left = 401
          Top = 32
          Width = 21
        end
        inherited cmbCA_DESCRIPCION: TArtComboBox
          Width = 150
        end
        inherited edCA_DOMICILIO: TEdit
          Width = 209
        end
        inherited edCA_LOCALIDAD: TEdit
          Left = 312
          Width = 82
        end
        inherited edCA_CODPOSTAL: TEdit
          Left = 425
        end
        inherited sdqDatos: TSDQuery
          Top = 48
        end
        inherited dsDatos: TDataSource
          Top = 48
        end
      end
    end
    object tsPrestacionesDinerarias: TTabSheet
      Caption = 'Prestaciones Dinerarias'
      ImageIndex = 9
      object Label20: TLabel
        Left = 11
        Top = 8
        Width = 41
        Height = 13
        Alignment = taRightJustify
        Caption = 'Siniestro'
      end
      object Label21: TLabel
        Left = 161
        Top = 8
        Width = 54
        Height = 13
        Caption = 'Documento'
      end
      object Label22: TLabel
        Left = 27
        Top = 36
        Width = 24
        Height = 13
        Alignment = taRightJustify
        Caption = 'CUIT'
      end
      object Label23: TLabel
        Left = 1
        Top = 64
        Width = 53
        Height = 13
        Alignment = taRightJustify
        Caption = 'Trabajador'
      end
      object edSiniestroPRESDIN: TSinEdit
        Left = 56
        Top = 4
        Width = 100
        Height = 21
        TabOrder = 0
        OnSelect = edSiniestroPRESDINSelect
      end
      inline fraRTD_TIPODOCUMENTO_PRESDIN: TfraRTD_TIPODOCUMENTO
        Left = 216
        Top = 3
        Width = 269
        Height = 24
        TabOrder = 1
        inherited cmbDescripcion: TArtComboBox
          Width = 204
        end
        inherited Propiedades: TPropiedadesFrame
          ExtraCondition = ' AND TD_SECTOR = '#39'ARCHSIN'#39' '
          ShowBajas = True
        end
      end
      inline fraEmpresaPRESDIN: TfraEmpresa
        Left = 56
        Top = 32
        Width = 429
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        inherited lbContrato: TLabel
          Left = 325
        end
        inherited edContrato: TIntEdit
          Left = 370
        end
        inherited cmbRSocial: TArtComboBox
          Width = 188
        end
      end
      inline fraTrabajadorPRESDIN: TfraTrabajador
        Left = 56
        Top = 60
        Width = 429
        Height = 21
        TabOrder = 3
        inherited cmbNombre: TArtComboBox
          Width = 341
        end
      end
    end
    object tsPrevencion: TTabSheet
      Caption = 'Prevencion'
      ImageIndex = 6
      object Label16: TLabel
        Left = 27
        Top = 36
        Width = 24
        Height = 13
        Alignment = taRightJustify
        Caption = 'CUIT'
      end
      object Label17: TLabel
        Left = 1
        Top = 64
        Width = 53
        Height = 13
        Alignment = taRightJustify
        Caption = 'Trabajador'
      end
      object Label18: TLabel
        Left = 11
        Top = 8
        Width = 41
        Height = 13
        Alignment = taRightJustify
        Caption = 'Siniestro'
      end
      object Label19: TLabel
        Left = 161
        Top = 8
        Width = 54
        Height = 13
        Caption = 'Documento'
      end
      object edSiniestroPREVENCION: TSinEdit
        Left = 56
        Top = 4
        Width = 100
        Height = 21
        TabOrder = 0
        OnSelect = edSiniestroPREVENCIONSelect
      end
      inline fraRTD_TIPODOCUMENTO_PREVENCION: TfraRTD_TIPODOCUMENTO
        Left = 216
        Top = 3
        Width = 263
        Height = 24
        TabOrder = 1
        inherited cmbDescripcion: TArtComboBox
          Width = 198
        end
        inherited Propiedades: TPropiedadesFrame
          ExtraCondition = ' AND TD_SECTOR = '#39'PREVENCION'#39' '
          ShowBajas = True
        end
      end
      inline fraEmpresaPREVENCION: TfraEmpresa
        Left = 56
        Top = 32
        Width = 421
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        inherited lbContrato: TLabel
          Left = 317
        end
        inherited edContrato: TIntEdit
          Left = 362
        end
        inherited cmbRSocial: TArtComboBox
          Width = 180
        end
      end
      inline fraTrabajadorPREVENCION: TfraTrabajador
        Left = 56
        Top = 60
        Width = 426
        Height = 21
        TabOrder = 3
        inherited cmbNombre: TArtComboBox
          Width = 337
        end
      end
    end
    object tsSiniestros: TTabSheet
      Caption = 'Siniestros'
      object lbSiniestro: TLabel
        Left = 12
        Top = 8
        Width = 41
        Height = 13
        Alignment = taRightJustify
        Caption = 'Siniestro'
      end
      object Label1: TLabel
        Left = 164
        Top = 8
        Width = 54
        Height = 13
        Caption = 'Documento'
      end
      object lbCUIT: TLabel
        Left = 26
        Top = 36
        Width = 24
        Height = 13
        Alignment = taRightJustify
        Caption = 'CUIT'
      end
      object Label2: TLabel
        Left = 1
        Top = 64
        Width = 53
        Height = 13
        Alignment = taRightJustify
        Caption = 'Trabajador'
      end
      object edSiniestro: TSinEdit
        Left = 56
        Top = 4
        Width = 100
        Height = 21
        TabOrder = 0
        OnSelect = edSiniestroSelect
      end
      inline fraRTD_TIPODOCUMENTO_ARCHSIN: TfraRTD_TIPODOCUMENTO
        Left = 220
        Top = 3
        Width = 263
        Height = 24
        TabOrder = 1
        DesignSize = (
          263
          24)
        inherited cmbDescripcion: TArtComboBox
          Width = 198
        end
        inherited Propiedades: TPropiedadesFrame
          ExtraCondition = ' AND TD_SECTOR = '#39'ARCHSIN'#39' '
          ShowBajas = True
        end
      end
      inline fraEmpresaSIN: TfraEmpresa
        Left = 56
        Top = 32
        Width = 425
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        inherited lbContrato: TLabel
          Left = 323
        end
        inherited edContrato: TIntEdit
          Left = 368
        end
        inherited cmbRSocial: TArtComboBox
          Width = 186
        end
      end
      inline fraTrabajadorSIN: TfraTrabajador
        Left = 56
        Top = 60
        Width = 431
        Height = 21
        TabOrder = 3
        inherited cmbNombre: TArtComboBox
          Width = 342
        end
      end
    end
  end
end
