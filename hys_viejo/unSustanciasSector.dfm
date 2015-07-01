inherited frmSustanciasSector: TfrmSustanciasSector
  Left = 329
  Top = 168
  VertScrollBar.Range = 0
  BorderStyle = bsNone
  Caption = 'frmSustanciasSector'
  ClientHeight = 629
  ClientWidth = 778
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblModosdeEmpleoBottom: TLabel [0]
    Left = 0
    Top = 527
    Width = 778
    Height = 13
    Align = alBottom
    Caption = 'Otros modos de Empleo'
  end
  inherited pnlFiltros: TPanel
    Width = 778
  end
  inherited CoolBar: TCoolBar
    Width = 778
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 774
      end>
    inherited ToolBar: TToolBar
      Width = 761
      object tbInformarFaltanteSustancia: TToolButton
        Left = 370
        Top = 0
        Hint = 'Informar Sustancias por Sector Faltantes'
        Caption = 'tbInformarFaltanteSustancia'
        ImageIndex = 31
        OnClick = tbInformarFaltanteSustanciaClick
      end
      object pnlLabelUbicacion: TLabel
        Left = 393
        Top = 0
        Width = 27
        Height = 22
        Caption = '     (6)'
      end
    end
  end
  inherited Grid: TArtDBGrid
    Width = 778
    Height = 453
    Columns = <
      item
        Expanded = False
        FieldName = 'rg_descripcion'
        Title.Caption = 'Codigo Quimico'
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SS_NOMBRECOMERCIAL'
        Title.Caption = 'Nombre Comercial'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SS_SECTOR'
        Title.Caption = 'Sector'
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SS_CANTLITROS'
        Title.Caption = 'Cant. Litros'
        Width = 164
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 116
    Top = 152
    Width = 470
    Height = 269
    BorderStyle = bsDialog
    inherited BevelAbm: TBevel
      Top = 233
      Width = 462
    end
    object Bevel1: TBevel [1]
      Left = -1
      Top = 59
      Width = 471
      Height = 2
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object lblOtrosModoEmpleo: TLabel [2]
      Left = 9
      Top = 108
      Width = 49
      Height = 41
      AutoSize = False
      Caption = 'Otros Modos de Empleo'
      WordWrap = True
    end
    object Label2: TLabel [3]
      Left = 9
      Top = 184
      Width = 31
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Sector'
    end
    object lblNombreComercial: TLabel [4]
      Left = 9
      Top = 36
      Width = 86
      Height = 13
      Caption = 'Nombre Comercial'
    end
    object Label4: TLabel [5]
      Left = 8
      Top = 209
      Width = 42
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Cantidad'
    end
    object Label5: TLabel [6]
      Left = 9
      Top = 12
      Width = 80
      Height = 13
      Caption = 'Nombre Qu'#237'mico'
    end
    object sbMantSectores: TSpeedButton [7]
      Left = 439
      Top = 181
      Width = 23
      Height = 22
      Hint = 'Mantenimiento de Sectores'
      Anchors = [akRight, akBottom]
      Glyph.Data = {
        36070000424D36070000000000003600000028000000200000000E0000000100
        2000000000000007000000000000000000000000000000000000FF00FF000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF008080
        8000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C00000000000FF00FF00FF00FF00FF00FF00FF00FF008080
        8000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C00000000000FF00FF00FF00FF00FF00FF00FF00FF008080
        8000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0
        C000000000000000000000000000000000000000000000000000FF00FF008080
        8000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0
        C000000000000000000000000000000000000000000000000000FF00FF008080
        8000FFFFFF00FF000000FF000000FF0000000000000000000000000000000000
        00000000000080808000808080008080800000000000FF000000FF00FF008080
        8000FFFFFF008080800080808000808080000000000000000000000000000000
        0000000000008080800080808000808080000000000080808000FF00FF008080
        8000FFFFFF00C0C0C000FFFFFF00C0C0C0000000000000000000C0C0C000C0C0
        C000C0C0C0008080800080808000C0C0C00000000000FF000000FF00FF008080
        8000FFFFFF00C0C0C000FFFFFF00C0C0C0000000000000000000808080008080
        8000808080008080800080808000808080000000000080808000FF00FF008080
        8000FFFFFF00FF000000FF000000FF0000000000000000FFFF00000000000000
        0000C0C0C000C0C0C000C0C0C000C0C0C0000000000080808000FF00FF008080
        8000FFFFFF008080800080808000808080000000000080808000000000000000
        0000C0C0C000C0C0C00080808000808080000000000080808000FF00FF008080
        8000FFFFFF00C0C0C000FFFFFF00C0C0C00000000000C0C0C00000FFFF000000
        0000C0C0C000C0C0C00000000000000000000000000000000000FF00FF008080
        8000FFFFFF00C0C0C000FFFFFF00C0C0C00000000000C0C0C000808080000000
        0000C0C0C000C0C0C00000000000000000000000000000000000FF00FF008080
        8000FFFFFF00FF000000FF000000FF000000FF00000000000000C0C0C00000FF
        FF00000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF008080
        8000FFFFFF008080800080808000808080008080800000000000C0C0C0008080
        8000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF008080
        8000FFFFFF00FFFFFF00FFFFFF00C0C0C000FFFFFF00C0C0C000000000000000
        000000FFFF000000000000000000FF00FF00FF00FF00FF00FF00FF00FF008080
        8000FFFFFF00FFFFFF00FFFFFF00C0C0C000FFFFFF00C0C0C000000000000000
        0000808080000000000000000000FF00FF00FF00FF00FF00FF00FF00FF008080
        8000FFFFFF00FF000000FF000000FF000000FF000000FF000000C0C0C000FFFF
        FF00FFFFFF0000FFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF008080
        8000FFFFFF008080800080808000808080008080800080808000C0C0C000FFFF
        FF00FFFFFF008080800000000000FF00FF00FF00FF00FF00FF00FF00FF008080
        8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000FFFFFF008080
        8000000000000000000000FFFF0000000000FF00FF00FF00FF00FF00FF008080
        8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000FFFFFF008080
        800000000000000000008080800000000000FF00FF00FF00FF00FF00FF008080
        8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
        8000FFFFFF0000000000FF00FF0000FFFF00FF00FF00FF00FF00FF00FF008080
        8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
        8000FFFFFF0000000000FF00FF0080808000FF00FF00FF00FF00FF00FF008080
        8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
        800000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008080
        8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
        800000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008080
        8000808080008080800080808000808080008080800080808000808080008080
        8000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008080
        8000808080008080800080808000808080008080800080808000808080008080
        8000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = sbMantSectoresClick
    end
    inherited btnAceptar: TButton
      Left = 312
      Top = 239
      TabOrder = 6
    end
    inherited btnCancelar: TButton
      Left = 390
      Top = 239
      TabOrder = 7
    end
    object edOtrosModosEmpleo: TMemo
      Left = 60
      Top = 110
      Width = 403
      Height = 68
      MaxLength = 500
      TabOrder = 3
    end
    inline fraSectores: TfraCodigoDescripcion
      Left = 59
      Top = 181
      Width = 377
      Height = 23
      Anchors = [akLeft, akBottom]
      TabOrder = 4
      inherited cmbDescripcion: TArtComboBox
        Width = 312
        DataSource = nil
      end
    end
    object edNombreComercial: TEdit
      Left = 100
      Top = 33
      Width = 361
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
    end
    object gbModoEmpleo: TGroupBox
      Left = 6
      Top = 65
      Width = 460
      Height = 40
      Anchors = [akLeft, akTop, akRight]
      Caption = '  Modos de Empleo  '
      TabOrder = 2
      object chkMatPrima: TCheckBox
        Left = 219
        Top = 15
        Width = 85
        Height = 17
        Caption = 'Materia Prima'
        TabOrder = 0
      end
      object chkAlmacenamiento: TCheckBox
        Left = 309
        Top = 15
        Width = 97
        Height = 17
        Caption = 'Almacenamiento'
        TabOrder = 1
      end
      object chkOtros: TCheckBox
        Left = 411
        Top = 15
        Width = 46
        Height = 17
        Caption = 'Otros'
        TabOrder = 2
      end
      object chkfluidodie: TCheckBox
        Left = 7
        Top = 15
        Width = 103
        Height = 17
        Caption = 'Fluido Diel'#233'ctrico'
        TabOrder = 3
      end
      object chkFluidoHidra: TCheckBox
        Left = 111
        Top = 15
        Width = 103
        Height = 17
        Caption = 'Fluido Hidr'#225'ulico'
        TabOrder = 4
      end
    end
    inline fraProdSector: TfraCodigoDescripcion
      Left = 98
      Top = 6
      Width = 367
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      inherited cmbDescripcion: TArtComboBox
        Width = 302
        OnChange = fraProdSectorcmbDescripcionChange
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Caption = 'C'#243'digo'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRIPCION'
            Title.Caption = 'Descripci'#243'n'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RG_CANTACCMAYORES'
            Title.Caption = 'Cant.'
            Width = 30
            Visible = True
          end>
      end
    end
    object edCantidad: TRxCalcEdit
      Left = 60
      Top = 207
      Width = 61
      Height = 21
      AutoSize = False
      ButtonWidth = 0
      Anchors = [akLeft, akBottom]
      MaxLength = 8
      NumGlyphs = 2
      TabOrder = 5
    end
  end
  object redOtrosModos: TRichEdit [5]
    Left = 0
    Top = 540
    Width = 778
    Height = 89
    Align = alBottom
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 4
  end
  inherited sdqConsulta: TSDQuery
    AfterScroll = sdqConsultaAfterScroll
    SQL.Strings = (
      
        'SELECT ss_id, ss_idinforme, ss_codigoquimico, rg_descripcion, ss' +
        '_nombrecomercial, ss_modosdeempleo, ss_otrasformas, ss_sector,'
      
        '       ss_cantlitros, ss_usualta, ss_fechaalta, ss_usumodif, ss_' +
        'fechamodif, ss_usubaja, ss_fechabaja'
      '  FROM hys.hss_sustanciasector, art.prg_riesgos'
      ' WHERE ss_codigoquimico = rg_id'
      '   AND ss_idinforme = :idInforme')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idInforme'
        ParamType = ptInput
      end>
  end
end
