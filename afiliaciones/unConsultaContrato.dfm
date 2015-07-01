inherited frmConsultaContrato: TfrmConsultaContrato
  Left = 194
  Top = 104
  Caption = 'Consulta de Contrato'
  ClientHeight = 601
  ClientWidth = 992
  Constraints.MinHeight = 500
  Constraints.MinWidth = 1000
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  ExplicitWidth = 1000
  ExplicitHeight = 631
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 992
    Height = 341
    ExplicitWidth = 992
    ExplicitHeight = 341
    object pcFiltros: TPageControl
      Left = 0
      Top = 0
      Width = 992
      Height = 341
      ActivePage = tsFiltros0
      Align = alClient
      MultiLine = True
      TabOrder = 0
      TabPosition = tpBottom
      object tsFiltros0: TTabSheet
        Caption = '&0-Filtros <<'
        DesignSize = (
          984
          315)
        object Label1: TLabel
          Left = 484
          Top = 212
          Width = 75
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'F. Vig. Desde el'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label2: TLabel
          Left = 664
          Top = 212
          Width = 8
          Height = 13
          Caption = 'al'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 484
          Top = 140
          Width = 75
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'F. Recepci'#243'n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 484
          Top = 164
          Width = 75
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'F. Baja'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label26: TLabel
          Left = 659
          Top = 140
          Width = 28
          Height = 13
          Caption = 'Hasta'
        end
        object Label27: TLabel
          Left = 659
          Top = 164
          Width = 28
          Height = 13
          Caption = 'Hasta'
        end
        object Label29: TLabel
          Left = 484
          Top = 188
          Width = 75
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'F. Recep. Afi.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label30: TLabel
          Left = 660
          Top = 188
          Width = 28
          Height = 13
          Caption = 'Hasta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 784
          Top = 140
          Width = 62
          Height = 13
          Caption = 'Usuario Rev.'
        end
        object Label28: TLabel
          Left = 784
          Top = 164
          Width = 65
          Height = 13
          Caption = 'Doc. Faltante'
        end
        object Label34: TLabel
          Left = 492
          Top = 236
          Width = 61
          Height = 13
          AutoSize = False
          Caption = 'F. Revisi'#243'n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label33: TLabel
          Left = 660
          Top = 236
          Width = 28
          Height = 13
          Caption = 'Hasta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label36: TLabel
          Left = 790
          Top = 187
          Width = 46
          Height = 13
          Caption = 'Tipo Reg.'
        end
        object GroupBox1: TGroupBox
          Left = 4
          Top = 40
          Width = 976
          Height = 44
          Anchors = [akLeft, akTop, akRight]
          Caption = ' Domicilio Postal '
          TabOrder = 1
          DesignSize = (
            976
            44)
          inline fraUB_CALLE_POSTAL: TfraLocalidad
            Left = 4
            Top = 16
            Width = 969
            Height = 25
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            ExplicitLeft = 4
            ExplicitTop = 16
            ExplicitWidth = 969
            ExplicitHeight = 25
            DesignSize = (
              969
              25)
            inherited lbProvincia: TLabel
              Left = 757
              ExplicitLeft = 757
            end
            inherited cmbLocalidad: TArtComboBox
              Top = 2
              Width = 600
              Font.Name = 'Tahoma'
              DataSource = nil
              ExplicitTop = 2
              ExplicitWidth = 600
            end
            inherited cmbProvincia: TCheckCombo
              Left = 803
              Width = 165
              ExplicitLeft = 803
              ExplicitWidth = 165
            end
            inherited edCPostal: TPatternEdit
              Font.Name = 'Tahoma'
            end
            inherited sdqDatos: TSDQuery
              Left = 229
              Top = 2
            end
          end
        end
        object GroupBox2: TGroupBox
          Left = 4
          Top = 84
          Width = 976
          Height = 44
          Anchors = [akLeft, akTop, akRight]
          Caption = ' Domicilio Legal '
          TabOrder = 2
          DesignSize = (
            976
            44)
          inline fraUB_CALLE_LEGAL: TfraLocalidad
            Left = 5
            Top = 16
            Width = 967
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            ExplicitLeft = 5
            ExplicitTop = 16
            ExplicitWidth = 967
            DesignSize = (
              967
              23)
            inherited lbProvincia: TLabel
              Left = 755
              ExplicitLeft = 755
            end
            inherited cmbLocalidad: TArtComboBox
              Width = 599
              Font.Name = 'Tahoma'
              DataSource = nil
              ExplicitWidth = 599
            end
            inherited cmbProvincia: TCheckCombo
              Left = 802
              Width = 165
              ExplicitLeft = 802
              ExplicitWidth = 165
            end
            inherited edCPostal: TPatternEdit
              Font.Name = 'Tahoma'
            end
            inherited sdqDatos: TSDQuery
              Left = 229
              Top = 1
            end
            inherited dsDatos: TDataSource
              Top = 1
            end
          end
        end
        object cmbCO_VIGENCIADESDE: TDateComboBox
          Left = 564
          Top = 208
          Width = 87
          Height = 21
          MaxDateCombo = cmbCO_VIGENCIAHASTA
          TabOrder = 13
        end
        object cmbCO_VIGENCIAHASTA: TDateComboBox
          Left = 692
          Top = 208
          Width = 88
          Height = 21
          MinDateCombo = cmbCO_VIGENCIADESDE
          TabOrder = 14
        end
        object cmbCO_FECHARECEPCIONDesde: TDateComboBox
          Left = 564
          Top = 136
          Width = 88
          Height = 21
          TabOrder = 7
        end
        object cmbCO_FECHABAJADesde: TDateComboBox
          Left = 564
          Top = 160
          Width = 88
          Height = 21
          TabOrder = 9
        end
        object cmbCO_FECHARECEPCIONHasta: TDateComboBox
          Left = 692
          Top = 136
          Width = 88
          Height = 21
          TabOrder = 8
        end
        object cmbCO_FECHABAJAHasta: TDateComboBox
          Left = 692
          Top = 160
          Width = 88
          Height = 21
          TabOrder = 10
        end
        object GroupBox3: TGroupBox
          Left = 4
          Top = 180
          Width = 293
          Height = 68
          Caption = 'Empleados'
          TabOrder = 5
          DesignSize = (
            293
            68)
          object Label11: TLabel
            Left = 14
            Top = 19
            Width = 76
            Height = 13
            Caption = 'Seg'#250'n Contrato'
          end
          object Label12: TLabel
            Left = 173
            Top = 19
            Width = 28
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Hasta'
          end
          object Label14: TLabel
            Left = 173
            Top = 46
            Width = 28
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Hasta'
          end
          object Label13: TLabel
            Left = 33
            Top = 46
            Width = 57
            Height = 13
            Caption = 'Seg'#250'n DDJJ'
          end
          object edCO_TOTEMPLEADOS_DESDE: TIntEdit
            Left = 94
            Top = 15
            Width = 72
            Height = 21
            TabOrder = 0
          end
          object edCO_TOTEMPLEADOS_HASTA: TIntEdit
            Left = 209
            Top = 15
            Width = 72
            Height = 21
            Anchors = [akTop, akRight]
            TabOrder = 1
          end
          object edCantEmpleadosHasta: TIntEdit
            Left = 209
            Top = 42
            Width = 72
            Height = 21
            Anchors = [akTop, akRight]
            TabOrder = 3
          end
          object edCantEmpleadosDesde: TIntEdit
            Left = 94
            Top = 42
            Width = 72
            Height = 21
            TabOrder = 2
          end
        end
        object GroupBox4: TGroupBox
          Left = 4
          Top = 128
          Width = 294
          Height = 48
          Caption = 'Estado'
          TabOrder = 3
          DesignSize = (
            294
            48)
          object cmbCO_ESTADO: TCheckCombo
            Left = 7
            Top = 20
            Width = 280
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
          end
        end
        object GroupBox5: TGroupBox
          Left = 4
          Top = 0
          Width = 976
          Height = 40
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          DesignSize = (
            976
            40)
          object lbRSocial: TLabel
            Left = 6
            Top = 16
            Width = 24
            Height = 13
            Caption = 'CUIT'
            FocusControl = fraEmpresaAfi.cmbRSocial
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          inline fraEmpresaAfi: TfraEmpresaAfi
            Left = 35
            Top = 12
            Width = 928
            Height = 23
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
            ExplicitLeft = 35
            ExplicitTop = 12
            ExplicitWidth = 928
            DesignSize = (
              928
              23)
            inherited lbContrato: TLabel
              Left = 693
              ExplicitLeft = 693
            end
            inherited lbFormulario: TLabel
              Left = 800
              Width = 50
              Font.Name = 'Tahoma'
              ExplicitLeft = 800
              ExplicitWidth = 50
            end
            inherited edContrato: TIntEdit
              Left = 738
              ExplicitLeft = 738
            end
            inherited cmbRSocial: TArtComboBox
              Width = 559
              DataSource = nil
              ExplicitWidth = 559
            end
            inherited edFormulario: TPatternEdit
              Left = 852
              ExplicitLeft = 852
            end
          end
        end
        object GroupBox6: TGroupBox
          Left = 300
          Top = 128
          Width = 181
          Height = 48
          Caption = 'Nro de Contrato'
          TabOrder = 4
          DesignSize = (
            181
            48)
          object Label8: TLabel
            Left = 76
            Top = 24
            Width = 28
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Hasta'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object edContratoHasta: TIntEdit
            Left = 107
            Top = 20
            Width = 67
            Height = 21
            TabOrder = 1
          end
          object edContratoDesde: TIntEdit
            Left = 6
            Top = 20
            Width = 65
            Height = 21
            Anchors = [akTop, akRight]
            TabOrder = 0
          end
        end
        object GroupBox7: TGroupBox
          Left = 301
          Top = 180
          Width = 181
          Height = 68
          Caption = 'D'#237'as Franquicia'
          TabOrder = 6
          object Label17: TLabel
            Left = 13
            Top = 22
            Width = 31
            Height = 13
            Caption = 'Desde'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label18: TLabel
            Left = 96
            Top = 22
            Width = 28
            Height = 13
            Caption = 'Hasta'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object edCO_DIASFRANQUICIA_DESDE: TIntEdit
            Left = 96
            Top = 38
            Width = 70
            Height = 21
            TabOrder = 1
          end
          object edCO_DIASFRANQUICIA_HASTA: TIntEdit
            Left = 11
            Top = 38
            Width = 70
            Height = 21
            TabOrder = 0
          end
        end
        object dcbFechaRecepAfiDesde: TDateComboBox
          Left = 564
          Top = 184
          Width = 87
          Height = 21
          MaxDateCombo = dcbFechaRecepAfiHasta
          TabOrder = 11
        end
        object dcbFechaRecepAfiHasta: TDateComboBox
          Left = 692
          Top = 184
          Width = 88
          Height = 21
          MinDateCombo = dcbFechaRecepAfiDesde
          TabOrder = 12
        end
        inline fraUsuarioRevision: TfraUsuarios
          Left = 851
          Top = 136
          Width = 124
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 15
          ExplicitLeft = 851
          ExplicitTop = 136
          ExplicitWidth = 124
          inherited cmbDescripcion: TArtComboBox
            Width = 31
            DataSource = nil
            ExplicitWidth = 31
          end
        end
        object edCO_FECHAREVISION_DESDE: TDateComboBox
          Left = 564
          Top = 232
          Width = 89
          Height = 21
          TabOrder = 16
        end
        object edCO_FECHAREVISION_HASTA: TDateComboBox
          Left = 692
          Top = 232
          Width = 89
          Height = 21
          TabOrder = 17
        end
        object edDocFaltante: TCheckCombo
          Left = 852
          Top = 161
          Width = 122
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 18
          Items.Strings = (
            'DNI.'
            'DNI sin firma del titular'
            'DNI sin firma del vendedor'
            'DNI inconsistente'
            'Poder.'
            'Poder sin firma del titular'
            'Poder sin firma del vendedor'
            'Poder inconsistente'
            'Contrato Social.'
            'Contrato Social sin firma del titular'
            'Contrato Social sin firma del vendedor'
            'Contrato Social inconsistente'
            'Acta de Designaci'#243'n.'
            'Acta de Designaci'#243'n sin firma del titular'
            'Acta de Designaci'#243'n sin firma del vendedor'
            'Acta de Designaci'#243'n inconsistente'
            'Acta de Asamblea.'
            'Acta de Asamblea sin firma del titular'
            'Acta de Asamblea sin firma del vendedor'
            'Acta de Asamblea inconsistente'
            'Condiciones Particulares.'
            'Condiciones Particulares sin firma del titular'
            'Condiciones Particulares sin firma del vendedor'
            'Condiciones Particulares inconsistente'
            'Condiciones Generales.'
            'Condiciones Generales sin firma del titular'
            'Condiciones Generales sin firma del vendedor'
            'Condiciones Generales inconsistente'
            'Cl'#225'usulas Adicionales.'
            'Cl'#225'usulas Adicionales sin firma del titular'
            'Cl'#225'usulas Adicionales sin firma del vendedor'
            'Cl'#225'usulas Adicionales inconsistente'
            'Adenda Plan Comercial 2011.'
            'Adenda Plan Comercial 2011 sin firma del titular'
            'Adenda Plan Comercial 2011 sin firma del vendedor'
            'RGRL.'
            'RGRL inconsistente'
            'Ubicaci'#243'n de Riesgo.'
            'Ubicaci'#243'n de Riesgo inconsistente'
            'Responsabilidad Civil Patronal.'
            'Responsabilidad Civil Patronal sin firma del titular'
            'Responsabilidad Civil Patronal sin firma del vendedor'
            'Sin revisi'#243'n de firmante'
            'Formulario PEP'
            'PEP sin firma del titular'
            'PEP sin firma del vendedor')
        end
        inline fraRegimen: TfraCodDesc
          Left = 851
          Top = 183
          Width = 124
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 19
          ExplicitLeft = 851
          ExplicitTop = 183
          ExplicitWidth = 124
          inherited cmbDescripcion: TArtComboBox
            Width = 59
            ExplicitWidth = 59
          end
          inherited Propiedades: TPropiedadesFrame
            FieldBaja = 'tr_fechabaja'
            FieldCodigo = 'tr_codigo'
            FieldDesc = 'tr_descripcion'
            FieldID = 'tr_id'
            TableName = 'AFI.ATR_TIPOREGIMEN'
            Left = 24
          end
        end
      end
      object tsFiltros1: TTabSheet
        Caption = '&1-Filtros <<'
        ImageIndex = 1
        DesignSize = (
          984
          315)
        object Label5: TLabel
          Left = 14
          Top = 12
          Width = 53
          Height = 13
          Caption = 'Motivo Alta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object LabelN: TLabel
          Left = 411
          Top = 12
          Width = 56
          Height = 13
          Caption = 'Motivo Baja'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 4
          Top = 36
          Width = 66
          Height = 13
          Caption = 'Ejecutivo Cta.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label9: TLabel
          Left = 414
          Top = 108
          Width = 53
          Height = 13
          Caption = 'Gestor Cta.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label10: TLabel
          Left = 406
          Top = 132
          Width = 61
          Height = 13
          Caption = 'ART Anterior'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbActividad: TLabel
          Left = 22
          Top = 60
          Width = 44
          Height = 13
          Caption = 'Actividad'
        end
        object Label15: TLabel
          Left = 436
          Top = 36
          Width = 31
          Height = 13
          Caption = 'Origen'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label16: TLabel
          Left = 3
          Top = 108
          Width = 69
          Height = 13
          Caption = 'Cl'#225'usulas Esp.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label19: TLabel
          Left = 14
          Top = 132
          Width = 55
          Height = 13
          Caption = 'ART Futura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label20: TLabel
          Left = 417
          Top = 60
          Width = 50
          Height = 13
          Caption = 'F. Jur'#237'dica'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label21: TLabel
          Left = 33
          Top = 198
          Width = 36
          Height = 13
          Caption = 'Holding'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label22: TLabel
          Left = 438
          Top = 84
          Width = 29
          Height = 13
          Caption = 'SUSS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label23: TLabel
          Left = 435
          Top = 176
          Width = 31
          Height = 13
          Caption = 'Sector'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label24: TLabel
          Left = 34
          Top = 225
          Width = 36
          Height = 13
          Caption = 'Entidad'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label25: TLabel
          Left = 421
          Top = 224
          Width = 46
          Height = 13
          Caption = 'Vendedor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label31: TLabel
          Left = 14
          Top = 156
          Width = 54
          Height = 13
          Caption = 'Delegaci'#243'n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label32: TLabel
          Left = 439
          Top = 201
          Width = 27
          Height = 13
          Caption = 'Canal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbEjecutivoEnt: TLabel
          Left = 6
          Top = 268
          Width = 67
          Height = 13
          Alignment = taRightJustify
          Caption = 'Ejecutivo Ent.'
        end
        object Label35: TLabel
          Left = 12
          Top = 247
          Width = 59
          Height = 13
          Caption = 'Organizador'
        end
        inline fraEntidades: TfraEntidades
          Left = 72
          Top = 220
          Width = 296
          Height = 23
          TabOrder = 9
          ExplicitLeft = 72
          ExplicitTop = 220
          ExplicitWidth = 296
          DesignSize = (
            296
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 63
            Top = 0
            Width = 231
            DataSource = nil
            ExplicitLeft = 63
            ExplicitTop = 0
            ExplicitWidth = 231
          end
          inherited edCodigo: TPatternEdit
            Top = 0
            ExplicitTop = 0
          end
        end
        inline fraVendedores: TfraVendedores
          Left = 472
          Top = 220
          Width = 486
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 20
          ExplicitLeft = 472
          ExplicitTop = 220
          ExplicitWidth = 486
          DesignSize = (
            486
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 63
            Top = 0
            Width = 421
            DataSource = nil
            ExplicitLeft = 63
            ExplicitTop = 0
            ExplicitWidth = 421
          end
          inherited edCodigo: TPatternEdit
            Top = 0
            ExplicitTop = 0
          end
        end
        inline fraCO_MOTIVOALTA: TfraStaticCTB_TABLAS
          Left = 72
          Top = 8
          Width = 296
          Height = 24
          TabOrder = 0
          ExplicitLeft = 72
          ExplicitTop = 8
          ExplicitWidth = 296
          ExplicitHeight = 24
          DesignSize = (
            296
            24)
          inherited edCodigo: TPatternEdit
            Top = 0
            ExplicitTop = 0
          end
          inherited cmbDescripcion: TComboGrid
            Top = 0
            Width = 231
            ExplicitTop = 0
            ExplicitWidth = 231
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
        inline fraEM_SECTOR: TfraStaticCTB_TABLAS
          Left = 472
          Top = 172
          Width = 486
          Height = 25
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 18
          ExplicitLeft = 472
          ExplicitTop = 172
          ExplicitWidth = 486
          ExplicitHeight = 25
          DesignSize = (
            486
            25)
          inherited edCodigo: TPatternEdit
            Top = 0
            ExplicitTop = 0
          end
          inherited cmbDescripcion: TComboGrid
            Top = 0
            Width = 421
            ExplicitTop = 0
            ExplicitWidth = 421
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
        inline fraEM_SUSS: TfraStaticCTB_TABLAS
          Left = 472
          Top = 80
          Width = 486
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 14
          ExplicitLeft = 472
          ExplicitTop = 80
          ExplicitWidth = 486
          DesignSize = (
            486
            23)
          inherited edCodigo: TPatternEdit
            Top = 0
            ExplicitTop = 0
          end
          inherited cmbDescripcion: TComboGrid
            Top = 0
            Width = 421
            ExplicitTop = 0
            ExplicitWidth = 421
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
        inline fraEM_FORMAJ: TfraStaticCTB_TABLAS
          Left = 472
          Top = 56
          Width = 486
          Height = 22
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 13
          ExplicitLeft = 472
          ExplicitTop = 56
          ExplicitWidth = 486
          ExplicitHeight = 22
          DesignSize = (
            486
            22)
          inherited edCodigo: TPatternEdit
            Top = 0
            ExplicitTop = 0
          end
          inherited cmbDescripcion: TComboGrid
            Top = 0
            Width = 421
            ExplicitTop = 0
            ExplicitWidth = 421
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
        inline fraCO_ORIGEN: TfraStaticCTB_TABLAS
          Left = 472
          Top = 32
          Width = 486
          Height = 22
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 12
          ExplicitLeft = 472
          ExplicitTop = 32
          ExplicitWidth = 486
          ExplicitHeight = 22
          DesignSize = (
            486
            22)
          inherited edCodigo: TPatternEdit
            Top = 0
            ExplicitTop = 0
          end
          inherited cmbDescripcion: TComboGrid
            Top = 0
            Width = 421
            ExplicitTop = 0
            ExplicitWidth = 421
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
        inline fraCO_MOTIVOBAJA: TfraStaticCTB_TABLAS
          Left = 472
          Top = 8
          Width = 486
          Height = 22
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 11
          ExplicitLeft = 472
          ExplicitTop = 8
          ExplicitWidth = 486
          ExplicitHeight = 22
          DesignSize = (
            486
            22)
          inherited edCodigo: TPatternEdit
            Top = 0
            ExplicitTop = 0
          end
          inherited cmbDescripcion: TComboGrid
            Top = 0
            Width = 421
            ExplicitTop = 0
            ExplicitWidth = 421
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
        inline fraCO_IDEJECUTIVO: TfraStaticCodigoDescripcion
          Left = 72
          Top = 32
          Width = 296
          Height = 23
          TabOrder = 1
          ExplicitLeft = 72
          ExplicitTop = 32
          ExplicitWidth = 296
          DesignSize = (
            296
            23)
          inherited edCodigo: TPatternEdit
            Top = 0
            ExplicitTop = 0
          end
          inherited cmbDescripcion: TComboGrid
            Top = 0
            Width = 231
            ExplicitTop = 0
            ExplicitWidth = 231
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
        inline fraCO_CLAUSULAESPECIAL: TfraStaticCTB_TABLAS
          Left = 72
          Top = 104
          Width = 296
          Height = 22
          TabOrder = 4
          ExplicitLeft = 72
          ExplicitTop = 104
          ExplicitWidth = 296
          ExplicitHeight = 22
          DesignSize = (
            296
            22)
          inherited edCodigo: TPatternEdit
            Top = 0
            ExplicitTop = 0
          end
          inherited cmbDescripcion: TComboGrid
            Top = 0
            Width = 231
            ExplicitTop = 0
            ExplicitWidth = 231
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
        inline fraCO_IDARTFUTURA: TfraStaticCodigoDescripcion
          Left = 72
          Top = 128
          Width = 296
          Height = 24
          TabOrder = 5
          ExplicitLeft = 72
          ExplicitTop = 128
          ExplicitWidth = 296
          ExplicitHeight = 24
          DesignSize = (
            296
            24)
          inherited edCodigo: TPatternEdit
            Top = 0
            ExplicitTop = 0
          end
          inherited cmbDescripcion: TComboGrid
            Top = 0
            Width = 231
            ExplicitTop = 0
            ExplicitWidth = 231
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
        inline fraCO_IDARTANTERIOR: TfraStaticCodigoDescripcion
          Left = 472
          Top = 128
          Width = 486
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 16
          ExplicitLeft = 472
          ExplicitTop = 128
          ExplicitWidth = 486
          DesignSize = (
            486
            23)
          inherited edCodigo: TPatternEdit
            Top = 0
            ExplicitTop = 0
          end
          inherited cmbDescripcion: TComboGrid
            Top = 0
            Width = 421
            ExplicitTop = 0
            ExplicitWidth = 421
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
        inline fraCO_IDGESTOR: TfraStaticCodigoDescripcion
          Left = 472
          Top = 104
          Width = 486
          Height = 25
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 15
          ExplicitLeft = 472
          ExplicitTop = 104
          ExplicitWidth = 486
          ExplicitHeight = 25
          DesignSize = (
            486
            25)
          inherited edCodigo: TPatternEdit
            Top = 0
            ExplicitTop = 0
          end
          inherited cmbDescripcion: TComboGrid
            Top = 0
            Width = 421
            ExplicitTop = 0
            ExplicitWidth = 421
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
        object edCO_IDACTIVIDAD_RESUMEN: TCheckCombo
          Left = 73
          Top = 56
          Width = 294
          Height = 21
          TabOrder = 2
          OnCloseUp = edCO_IDACTIVIDAD_RESUMENCloseUp
        end
        object edCO_IDACTIVIDAD: TComboBox
          Left = 73
          Top = 80
          Width = 294
          Height = 21
          TabOrder = 3
          OnDropDown = edCO_IDACTIVIDADDropDown
        end
        object chkEntidadPorContrato: TCheckBox
          Left = 72
          Top = 291
          Width = 624
          Height = 17
          Caption = 
            'Una Entidad Por Contrato (Evita la posibilidad de que los datos ' +
            'se vean duplicados debido a cada entidad relacionada)'
          Checked = True
          State = cbChecked
          TabOrder = 21
        end
        object chkTodosFutura: TCheckBox
          Left = 73
          Top = 176
          Width = 254
          Height = 17
          Caption = 'Mostrar todos los contratos con ART Futura'
          TabOrder = 7
        end
        object chkTodosAnterior: TCheckBox
          Left = 473
          Top = 154
          Width = 254
          Height = 17
          Caption = 'Mostrar todos los contratos con ART Anterior'
          TabOrder = 17
        end
        inline fraEM_HOLDING: TfraCodDesc
          Left = 72
          Top = 195
          Width = 296
          Height = 23
          TabOrder = 8
          ExplicitLeft = 72
          ExplicitTop = 195
          ExplicitWidth = 296
          DesignSize = (
            296
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 63
            Top = 0
            Width = 231
            DataSource = nil
            ExplicitLeft = 63
            ExplicitTop = 0
            ExplicitWidth = 231
          end
          inherited edCodigo: TPatternEdit
            Top = 0
            ExplicitTop = 0
          end
          inherited Propiedades: TPropiedadesFrame
            ExtraCondition = 'AND GE_TEMPORAL IS NULL'
            FieldBaja = 'GE_FECHABAJA'
            FieldCodigo = 'GE_CODIGO'
            FieldDesc = 'GE_DESCRIPCION'
            FieldID = 'GE_ID'
            IdType = ctInteger
            TableName = 'AGE_GRUPOECONOMICO'
            Left = 100
          end
        end
        inline fraDelegacion: TfraCodDesc
          Left = 72
          Top = 152
          Width = 296
          Height = 23
          TabOrder = 6
          ExplicitLeft = 72
          ExplicitTop = 152
          ExplicitWidth = 296
          DesignSize = (
            296
            23)
          inherited cmbDescripcion: TArtComboBox
            Top = 0
            Width = 231
            DataSource = nil
            ExplicitTop = 0
            ExplicitWidth = 231
          end
          inherited edCodigo: TPatternEdit
            Top = 0
            ExplicitTop = 0
          end
          inherited Propiedades: TPropiedadesFrame
            CodigoType = ctInteger
            FieldBaja = 'el_fechabaja'
            FieldCodigo = 'el_id'
            FieldDesc = 'el_nombre'
            FieldID = 'el_id'
            IdType = ctInteger
            TableName = 'del_delegacion'
          end
        end
        inline fraCanal: TfraCanal
          Left = 472
          Top = 196
          Width = 486
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 19
          ExplicitLeft = 472
          ExplicitTop = 196
          ExplicitWidth = 486
          DesignSize = (
            486
            23)
          inherited cmbDescripcion: TComboGrid
            Width = 421
            ExplicitWidth = 421
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
        inline fraEjecutivoEnt: TfraStaticCodigoDescripcion
          Left = 72
          Top = 265
          Width = 294
          Height = 23
          TabOrder = 22
          ExplicitLeft = 72
          ExplicitTop = 265
          ExplicitWidth = 294
          inherited cmbDescripcion: TComboGrid
            Width = 231
            ExplicitWidth = 231
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
        inline fraOrganizador: TfraCodDesc
          Tag = -956
          Left = 73
          Top = 242
          Width = 306
          Height = 23
          TabOrder = 10
          ExplicitLeft = 73
          ExplicitTop = 242
          ExplicitWidth = 306
          inherited cmbDescripcion: TArtComboBox
            Left = 62
            Width = 231
            ExplicitLeft = 62
            ExplicitWidth = 231
          end
          inherited edCodigo: TPatternEdit
            Left = 0
            ExplicitLeft = 0
          end
          inherited Propiedades: TPropiedadesFrame
            ExtraCondition = 
              ' AND EXISTS(SELECT 1 FROM xgo_granorganizador WHERE go_identorga' +
              'nizador = en_id AND go_fechabaja IS NULL)'
            FieldBaja = 'en_fechabaja'
            FieldCodigo = 'en_codbanco'
            FieldDesc = 'en_nombre'
            FieldID = 'en_id'
            IdType = ctInteger
            OrderBy = 'en_nombre, en_fechabaja DESC'
            TableName = 'xen_entidad'
          end
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 341
    Width = 992
    Height = 31
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 986
      end>
    ExplicitTop = 341
    ExplicitWidth = 992
    ExplicitHeight = 31
    inherited ToolBar: TToolBar
      Width = 979
      ExplicitWidth = 979
      inherited tbNuevo: TToolButton
        Hint = 'Eventos Traspaso Ingreso'
        ImageIndex = 9
        Visible = True
        OnClick = tbNuevoClick
      end
      inherited tbModificar: TToolButton
        Hint = 'Ver (Ctrl+V)'
        Visible = True
        OnClick = tbModificarClick
      end
      inherited tbPropiedades: TToolButton
        Hint = ''
        Enabled = False
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Visible = True
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbImprimirUltimaRenovacion: TToolButton
        Left = 370
        Top = 0
        Hint = 'Imprimir '#250'ltima Renovaci'#243'n autom'#225'tica'
        Caption = 'tbImprimirUltimaRenovacion'
        DropdownMenu = mnuRenovacionAutomatica
        ImageIndex = 52
        Style = tbsDropDown
        OnClick = tbImprimirUltimaRenovacionClick
      end
      object tbConsulta: TToolButton
        Left = 408
        Top = 0
        Hint = 'Consulta Ultimo Endoso'
        ImageIndex = 32
        OnClick = tbConsultaClick
      end
      object tbVerTarifas: TToolButton
        Left = 431
        Top = 0
        Hint = 'Ver Tarifas'
        AllowAllUp = True
        ImageIndex = 23
        Style = tbsCheck
        OnClick = tbVerTarifasClick
      end
      object tbSumatoria: TToolButton
        Left = 454
        Top = 0
        Hint = 'Sumatoria'
        ImageIndex = 48
        Style = tbsCheck
        OnClick = tbSumatoriaClick
      end
      object ToolButton1: TToolButton
        Left = 477
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 485
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
      object pnlTotalRegistros: TPanel
        Left = 508
        Top = 0
        Width = 151
        Height = 22
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = ' Cant. Contratos'
        TabOrder = 0
        Visible = False
        DesignSize = (
          151
          22)
        object edTotalRegistros: TCardinalEdit
          Left = 89
          Top = 0
          Width = 61
          Height = 21
          TabStop = False
          Anchors = [akTop, akRight]
          Color = clSilver
          Enabled = False
          ReadOnly = True
          TabOrder = 0
        end
      end
      object ToolButton2: TToolButton
        Left = 659
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 6
        Style = tbsSeparator
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 372
    Width = 992
    Height = 229
    TitleFont.Name = 'Tahoma'
    OnPaintFooter = GridPaintFooter
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Nombre'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_CUIT'
        Title.Caption = 'CUIT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_CONTRATO'
        Title.Caption = 'Nro. Contrato'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO'
        Title.Caption = 'Estado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TC_ALICUOTAPESOS'
        Title.Caption = 'Suma Fija'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TC_PORCMASA'
        Title.Caption = 'Porcentaje Variable'
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_VIGENCIADESDE'
        Title.Caption = 'Vigencia Desde'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_VIGENCIAHASTA'
        Title.Caption = 'Vigencia Hasta'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_FECHAIMPRESION'
        Title.Caption = 'Fecha de Impresi'#243'n'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_RECEPCONTRATO'
        Title.Caption = 'Recepci'#243'n del Contrato'
        Width = 124
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FO_FORMULARIO'
        Title.Caption = 'Nro.Formulario'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ORIGEN'
        Title.Caption = 'Origen'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_FECHARECEPCION'
        Title.Caption = 'Fecha de Recepci'#243'n'
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_FEINICACTIV'
        Title.Caption = 'Fecha Inicio Activ.'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_FECHAAFILIACION'
        Title.Caption = 'Fecha de Afiliaci'#243'n'
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FORMAJ'
        Title.Caption = 'Forma Jur'#237'dica'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SECTOR'
        Title.Caption = 'Sector'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HOLDIN'
        Title.Caption = 'Holding'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_SUSS'
        Title.Caption = 'SUSS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EJCUENTA'
        Title.Caption = 'Ejecutivo de Cuenta'
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GESTOR'
        Title.Caption = 'Gestor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ART_ACT'
        Title.Caption = 'ART Anterior'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_FECHABAJA'
        Title.Caption = 'Fecha de Baja'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MOTIVO_BAJA'
        Title.Caption = 'Motivo Baja'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ART_FUT'
        Title.Caption = 'ART Futura'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AC_DESCRIPCION'
        Title.Caption = 'Actividad'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_NIVEL'
        Title.Caption = 'Nivel'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_TOTEMPLEADOS'
        Title.Caption = 'Total Empleados'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_MASATOTAL'
        Title.Caption = 'Masa Total'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_DIASFRANQUICIA'
        Title.Caption = 'D'#237'as Franquicia'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_VIGENCIAFRANQUICIA'
        Title.Caption = 'Vigencia Franquicia'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_CLAUSULAESPECIAL'
        Title.Caption = 'Cl'#225'usula Especial'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_VIGENCIACLAUSULA'
        Title.Caption = 'Vigencia Cl'#225'usula'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOM_LEGAL'
        Title.Caption = 'Domicilio Legal'
        Width = 123
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOC_LEGAL'
        Title.Caption = 'Localidad Legal'
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOM_POSTAL'
        Title.Caption = 'Domicilio Postal'
        Width = 121
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOC_POSTAL'
        Title.Caption = 'Localidad Postal'
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NRO_CLIENTE'
        Title.Caption = 'N'#186' Cliente'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_FECHARECEPCIONSECTORAFI'
        Title.Caption = 'F. Recep. Afi.'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'XEN_EN_ID'
        Title.Caption = 'C'#243'digo Entidad'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EN_NOMBRE'
        Title.Caption = 'Entidad'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VE_ID'
        Title.Caption = 'C'#243'digo Vendedor'
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VE_NOMBRE'
        Title.Caption = 'Vendedor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODIGOCANAL'
        Title.Caption = 'C'#243'digo Canal'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANAL'
        Title.Caption = 'Canal'
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'rc_empleados'
        Title.Alignment = taRightJustify
        Title.Caption = 'Empleados '#218'ltimo Per'#237'odo Devengado'
        Width = 203
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'rc_masasalarial'
        Title.Alignment = taRightJustify
        Title.Caption = 'Masa Salarial '#218'ltimo Per'#237'odo Devengado'
        Width = 211
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'as_nombre'
        Title.Caption = 'Gestor de Emisi'#243'n'
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EL_NOMBRE'
        Title.Caption = 'Delegaci'#243'n'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FGRL'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DNIPODER'
        Title.Alignment = taCenter
        Title.Caption = 'DNI/Poder'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'su_descripcion'
        Title.Caption = 'Sucursal'
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ejecutivoentidad'
        Title.Caption = 'Ejecutivo Entidad'
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'faltarenglon'
        Title.Caption = 'Doc. Faltante'
        Width = 246
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'co_usurevision'
        Title.Caption = 'Usuario Revisi'#243'n'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fecharev'
        Title.Caption = 'Fecha Revisi'#243'n'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sin_revision'
        Title.Caption = 'Contrato sin revisi'#243'n de firmante'
        Width = 166
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DNI'
        Title.Caption = 'D.N.I.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DNI_tit'
        Title.Caption = 'D.N.I. sin firma del titular'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DNI_vend'
        Title.Caption = 'D.N.I. sin firma del vendedor'
        Width = 149
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DNI_incon'
        Title.Caption = 'D.N.I. inconsistente'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Poder'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Poder_tit'
        Title.Caption = 'Poder sin firma del titular'
        Width = 132
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Poder_vend'
        Title.Caption = 'Poder sin firma del vendedor'
        Width = 141
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Poder_incon'
        Title.Caption = 'Poder inconsistente'
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CSocial'
        Title.Caption = 'Contrato Social'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CSocial_tit'
        Title.Caption = 'Contrato Social sin firma del titular'
        Width = 174
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CSocial_vend'
        Title.Caption = 'Contrato Social sin firma del vendedor'
        Width = 188
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CSocial_incon'
        Title.Caption = 'Contrato Social inconsistente'
        Width = 144
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ADesig'
        Title.Caption = 'Acta de Designaci'#243'n'
        Width = 118
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ADesig_tit'
        Title.Caption = 'Acta de Designaci'#243'n sin firma del titular'
        Width = 197
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ADesig_vend'
        Title.Caption = 'Acta de Designaci'#243'n sin firma del vendedor'
        Width = 221
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ADesig_incon'
        Title.Caption = 'Acta de Designaci'#243'n inconsistente'
        Width = 171
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AAsamblea'
        Title.Caption = 'Acta de Asamblea'
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AAsamblea_tit'
        Title.Caption = 'Acta de Asamblea sin firma del titular'
        Width = 194
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AAsamblea_vend'
        Title.Caption = 'Acta de Asamblea sin firma del vendedor'
        Width = 213
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AAsamblea_incon'
        Title.Caption = 'Acta de Asamblea inconsistente'
        Width = 156
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CPart'
        Title.Caption = 'Condiciones Particulares'
        Width = 122
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CPart_tit'
        Title.Caption = 'Condiciones Particulares sin firma del titular'
        Width = 217
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CPart_vend'
        Title.Caption = 'Condiciones Particulares sin firma del vendedor'
        Width = 238
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CPart_incon'
        Title.Caption = 'Condiciones Particulares inconsistente'
        Width = 188
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CGenerales'
        Title.Caption = 'Condiciones Generales'
        Width = 126
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CGenerales_tit'
        Title.Caption = 'Condiciones Generales sin firma del titular'
        Width = 216
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CGenerales_vend'
        Title.Caption = 'Condiciones Generales sin firma del vendedor'
        Width = 228
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CGenerales_incon'
        Title.Caption = 'Condiciones Generales inconsistente'
        Width = 179
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CAdicionales'
        Title.Caption = 'Cl'#225'usulas Adicionales'
        Width = 123
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CAdicionales_tit'
        Title.Caption = 'Cl'#225'usulas Adicionales sin firma del titular'
        Width = 212
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CAdicionales_vend'
        Title.Caption = 'Cl'#225'usulas Adicionales sin firma del vendedor'
        Width = 226
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CAdicionales_incon'
        Title.Caption = 'Cl'#225'usulas Adicionales inconsistente'
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Plan2011'
        Title.Caption = 'Adenda Plan Comercial 2011'
        Width = 151
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Plan2011_tit'
        Title.Caption = 'Adenda Plan Comercial 2011 sin firma del titular'
        Width = 233
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Plan2011_vend'
        Title.Caption = 'Adenda Plan Comercial 2011 sin firma del vendedor'
        Width = 251
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RGRL'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RGRL_incon'
        Title.Caption = 'RGRL inconsistente'
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'URiesgo'
        Title.Caption = 'Ubicaci'#243'n de Riesgo'
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'URiesgo_incon'
        Title.Caption = 'Ubicaci'#243'n de Riesgo inconsistente'
        Width = 176
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RC'
        Title.Caption = 'Responsabilidad Civil Patronal'
        Width = 158
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RC_tit'
        Title.Caption = 'Responsabilidad Civil Patronal sin firma del titular'
        Width = 243
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RC_vend'
        Title.Caption = 'Responsabilidad Civil Patronal sin firma del vendedo'
        Width = 262
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PEP'
        Title.Caption = 'Formulario PEP'
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PEP_tit'
        Title.Caption = 'PEP sin firma del titular'
        Width = 133
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PEP_vend'
        Title.Caption = 'PEP sin firma del vendedor'
        Width = 168
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tareaSic'
        Title.Caption = 'Tarea Sic'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'organizador'
        Title.Caption = 'Organizador'
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT aem.em_nombre, aem.em_cuit, aco.co_contrato, estado.tb_de' +
        'scripcion AS estado, aco.co_vigenciadesde, aco.co_vigenciahasta,'
      
        '       aco.co_fechaimpresion, aco.co_recepcontrato, afo.fo_formu' +
        'lario, origen.tb_descripcion AS origen, aco.co_fecharecepcion,'
      
        '       aem.em_feinicactiv, aco.co_fechaafiliacion, formaj.tb_des' +
        'cripcion AS formaj, sector.tb_descripcion AS sector,'
      
        '       ge_descripcion AS holdin, aem.em_suss, ecuenta.ec_nombre ' +
        'AS ejcuenta, gestor.gc_nombre AS gestor,'
      
        '       artact.ar_nombre AS art_act, aco.co_fechabaja, mot_baj.tb' +
        '_descripcion AS motivo_baja, artfut.ar_nombre AS art_fut,'
      
        '       act.ac_descripcion, aco.co_nivel, aco.co_totempleados, ac' +
        'o.co_masatotal, aco.co_observaciones, aco.co_diasfranquicia,'
      
        '       aco.co_vigenciafranquicia, aco.co_clausulaespecial, aco.c' +
        'o_vigenciaclausula,'
      '       afiliacion.get_ultidendoso(aco.co_contrato) AS en_id'
      
        '  FROM aco_contrato aco, aem_empresa aem, ctb_tablas estado, afo' +
        '_formulario afo, ctb_tablas origen, ctb_tablas formaj,'
      
        '       ctb_tablas sector, age_grupoeconomico holdin, afi.aec_eje' +
        'cutivocuenta ecuenta, afi.agc_gestorcuenta gestor,'
      
        '       aar_art artact, aar_art artfut, ctb_tablas mot_baj, cac_a' +
        'ctividad act, adc_domiciliocontrato adc_legal,'
      '       adc_domiciliocontrato adc_postal'
      ' WHERE aem.em_id = aco.co_idempresa'
      '   AND estado.tb_codigo = aco.co_estado'
      '   AND estado.tb_clave = '#39'AFEST'#39
      '   AND afo.fo_id = aco.co_idformulario'
      '   AND origen.tb_codigo = aco.co_origen'
      '   AND origen.tb_clave = '#39'ORSOL'#39
      '   AND formaj.tb_codigo(+) = aem.em_formaj'
      '   AND formaj.tb_clave(+) = '#39'FJURI'#39
      '   AND sector.tb_codigo(+) = aem.em_sector'
      '   AND sector.tb_clave(+) = '#39'SECT'#39
      '   AND holdin.ge_id(+) = aem.em_idgrupoeconomico'
      '   AND ecuenta.ec_id(+) = aco.co_codejecutivo'
      '   AND gestor.gc_id(+) = aco.co_idgestor'
      '   AND artact.ar_id(+) = aco.co_idartanterior'
      '   AND mot_baj.tb_codigo(+) = aco.co_motivobaja'
      '   AND mot_baj.tb_clave(+) = '#39'MOTIB'#39
      '   AND artfut.ar_id(+) = aco.co_idartfutura'
      '   AND act.ac_id(+) = aco.co_idactividad'
      '   AND adc_legal.dc_contrato = aco.co_contrato'
      '   AND adc_legal.dc_tipo = '#39'L'#39
      '   AND adc_postal.dc_contrato = aco.co_contrato'
      '   AND adc_postal.dc_tipo = '#39'P'#39)
    Left = 112
    Top = 420
  end
  inherited dsConsulta: TDataSource
    Left = 140
    Top = 420
  end
  inherited SortDialog: TSortDialog
    Left = 112
    Top = 448
  end
  inherited ExportDialog: TExportDialog
    Left = 140
    Top = 448
  end
  inherited QueryPrint: TQueryPrint
    DataSource = nil
    PageOrientation = pxLandscape
    PageSize = psLegal
    Left = 140
    Top = 476
  end
  inherited Seguridad: TSeguridad
    DBLogin = frmPrincipal.DBLogin
    Left = 111
    Top = 392
  end
  inherited FormStorage: TFormStorage
    StoredProps.Strings = (
      'tbVerTarifas.Down')
    Left = 140
    Top = 392
  end
  inherited PrintDialog: TPrintDialog
    Left = 112
    Top = 476
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
      end
      item
        Key = 16462
        LinkControl = tbNuevo
      end
      item
        Key = 16430
        LinkControl = tbEliminar
      end
      item
        Key = 16460
        LinkControl = tbLimpiar
      end
      item
        Key = 16463
        LinkControl = tbOrdenar
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16453
        LinkControl = tbExportar
      end
      item
        Key = 16467
        LinkControl = tbSalir2
      end
      item
        Key = 16470
        LinkControl = tbModificar
      end>
    Left = 168
    Top = 392
  end
  inherited FieldHider: TFieldHider
    Left = 168
    Top = 420
  end
  object mnuRenovacionAutomatica: TPopupMenu
    Left = 378
    Top = 286
    object mnuImprimirRenovacionAutomatica: TMenuItem
      Caption = 'Imprimir'
      OnClick = mnuImprimirRenovacionAutomaticaClick
    end
    object mnuMailRenovacionAutomatica: TMenuItem
      Caption = 'Mail'
      OnClick = mnuMailRenovacionAutomaticaClick
    end
  end
end
