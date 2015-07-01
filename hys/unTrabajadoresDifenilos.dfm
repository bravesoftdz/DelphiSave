inherited frmTrabajadoresDifenilos: TfrmTrabajadoresDifenilos
  VertScrollBar.Range = 0
  BorderStyle = bsNone
  Caption = 'frmTrabajadoresDifenilos'
  ClientHeight = 573
  ClientWidth = 935
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 935
  end
  inherited CoolBar: TCoolBar
    Width = 935
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 931
      end>
    inherited ToolBar: TToolBar
      Width = 918
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbTrabajadoresUltRelev: TToolButton
        Left = 370
        Top = 0
        Hint = 'Importar desde '#250'ltimo Relev. Expuestos'
        Caption = 'tbTrabajadoresUltRelev'
        ImageIndex = 19
        OnClick = tbTrabajadoresUltRelevClick
      end
      object tbInformarFaltanteTrabajador: TToolButton
        Left = 393
        Top = 0
        Hint = 'Informar Trabajadores Difenilos Faltantes'
        Caption = 'tbInformarFaltanteTrabajador'
        ImageIndex = 31
        OnClick = tbInformarFaltanteTrabajadorClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Width = 935
    Height = 499
    Columns = <
      item
        Expanded = False
        FieldName = 'TD_CUIL'
        Title.Caption = 'Cuil'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TD_TIPODOCUMENTO'
        Title.Caption = 'Tipo documento'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TD_EDAD'
        Title.Caption = 'Edad'
        Width = 94
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 236
    Top = 112
    Width = 543
    Height = 148
    inherited BevelAbm: TBevel
      Top = 112
      Width = 535
    end
    object lbTrabCUIL: TLabel [1]
      Left = 9
      Top = 12
      Width = 28
      Height = 13
      AutoSize = False
      Caption = 'CUIL'
    end
    object Label1: TLabel [2]
      Left = 9
      Top = 62
      Width = 99
      Height = 14
      AutoSize = False
      Caption = 'Tipo de Documento'
    end
    object Label2: TLabel [3]
      Left = 449
      Top = 62
      Width = 25
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = 'Edad'
    end
    object Label3: TLabel [4]
      Left = 9
      Top = 88
      Width = 100
      Height = 14
      AutoSize = False
      Caption = 'Antig'#252'edad '
    end
    object Bevel2: TBevel [5]
      Left = 4
      Top = 50
      Width = 535
      Height = 3
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object sbManTrab: TSpeedButton [6]
      Left = 510
      Top = 8
      Width = 24
      Height = 22
      Hint = 'Mantenimiento de '#13#10'Trabajadores'
      Flat = True
      Glyph.Data = {
        36050000424D360500000000000036000000280000001A000000100000000100
        18000000000000050000C40E0000C40E0000000000000000000000FF00000033
        0000330000990000800000FF0000CC0000CC00009900008004040400FF0000FF
        0000FF005F5F5F5F5F5F5F5F5F5555557777776666666666666666665F5F5F77
        777700FF0000FF00000000FF0000FF000000FF000099000080969696A4A0A086
        868666666604040400FF0000FF0000FF0000FF0000FF007777775F5F5F4D4D4D
        969696A4A0A086868666666677777700FF0000FF0000FF00000000FF0000FF00
        000080969696C0C0C0B2B2B2A4A0A086868604040400FF0000FF0000FF0000FF
        0000FF0000FF00555555969696C0C0C0B2B2B2A4A0A086868680808000FF0000
        FF0000FF0000FF00000000FF0000FF00040404CCCCCCC0C0C0B2B2B2A4A0A086
        868604040404040404040400FF0000FF0000FF0000FF00808080CCCCCCC0C0C0
        B2B2B2A4A0A086868680808080808080808000FF0000FF00000000FF00040404
        1C1C1C040404C0C0C0B2B2B2A4A0A004040404040404040404040404040400FF
        0000FF00808080808080868686C0C0C0B2B2B2A4A0A080808080808080808080
        808080808000FF00000000FF001C1C1C1C1C1C040404040404C0C0C0CCCCCCCC
        CCCCCCCCCCCCCCCCC0C0C004040400FF0000FF00868686808080868686868686
        C0C0C0CCCCCCCCCCCCCCCCCCCCCCCCC0C0C080808000FF0000001C1C1C1C1C1C
        1C1C1C040404040404040404DDDDDDD7D7D7D7D7D7CCCCCCC0C0C004040400FF
        00808080808080808080868686868686868686DDDDDDD7D7D7D7D7D7CCCCCCC0
        C0C080808000FF0000001C1C1C1C1C1C040404040404040404C0C0C0DDDDDDDD
        DDDDD7D7D7CCCCCCC0C0C0040404040404808080808080868686868686868686
        C0C0C0DDDDDDDDDDDDD7D7D7CCCCCCC0C0C086868680808000001C1C1C1C1C1C
        040404040404C0C0C0E3E3E3E3E3E3DDDDDDD7D7D7D7D7D7CCCCCCC0C0C000FF
        00808080808080868686868686C0C0C0DDDDDDDDDDDDDDDDDDD7D7D7D7D7D7CC
        CCCCC0C0C000FF0000001C1C1C1C1C1C040404040404040404C0C0C0DDDDDDDD
        DDDDDDDDDDFF0000E3E3E304040400FF00808080868686868686868686868686
        C0C0C0DDDDDDDDDDDDDDDDDD5F5F5FDDDDDD86868600FF0000001C1C1C1C1C1C
        1C1C1C040404040404040404040404DDDDDDDDDDDD04040404040404040400FF
        00808080808080808080868686868686868686868686DDDDDDDDDDDD86868686
        868686868600FF0000001C1C1C1C1C1C1C1C1C040404040404040404040404C0
        C0C0DDDDDDDDDDDDCCCCCC04040400FF00808080808080808080868686868686
        868686868686C0C0C0DDDDDDDDDDDDCCCCCC86868600FF00000000FF001C1C1C
        1C1C1C1C1C1C040404040404040404040404C0C0C0DDDDDDCCCCCC04040400FF
        0000FF00808080808080808080868686868686868686868686C0C0C0DDDDDDCC
        CCCC86868600FF00000000FF001C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C04
        040404040404040404040404040400FF0000FF00868686808080808080808080
        86868680808086868686868686868686868686868600FF00000000FF0000FF00
        1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C0404040404040404040404041C1C1C00FF
        0000FF0000FF0080808080808080808080808080808086868686868686868686
        868680808000FF00000000FF0000FF0000FF001C1C1C1C1C1C1C1C1C1C1C1C1C
        1C1C1C1C1C1C1C1C1C1C1C00FF0000FF0000FF0000FF0000FF00868686808080
        80808080808086868680808080808080808000FF0000FF000000}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = sbManTrabClick
    end
    object lblRelacion: TLabel [7]
      Left = 9
      Top = 33
      Width = 74
      Height = 13
      Caption = 'Relacion activa'
    end
    inherited btnAceptar: TButton
      Left = 385
      Top = 118
    end
    inherited btnCancelar: TButton
      Left = 463
      Top = 118
    end
    inline fraTipoDocumento: TfraStaticCTB_TABLAS
      Left = 110
      Top = 57
      Width = 335
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      inherited edCodigo: TPatternEdit
        Top = 0
        Width = 56
      end
      inherited cmbDescripcion: TComboGrid
        Left = 60
        Top = 0
        Width = 271
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
    object edEdad: TIntEdit
      Left = 481
      Top = 57
      Width = 56
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 3
      MaxLength = 2
    end
    object edAntiguedad: TIntEdit
      Left = 111
      Top = 84
      Width = 56
      Height = 21
      TabOrder = 4
      Alignment = taRightJustify
      MaxLength = 3
    end
    object cmbTipoUnidad: TComboBox
      Left = 171
      Top = 84
      Width = 134
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 5
      Items.Strings = (
        'D'#237'as'
        'Meses'
        'A'#241'os')
    end
    inline fraTrabajador: TfraTrabajadorAMP
      Left = 39
      Top = 9
      Width = 469
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 6
      inherited cmbNombre: TArtComboBox
        Width = 385
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT td_id, td_idinforme, td_cuil, td_tipodocumento, td_edad, ' +
        'td_antiguedad, td_tipoantiguedad, td_usualta, td_fechaalta,'
      '       td_usumodif, td_fechamodif, td_usubaja, td_fechabaja'
      '  FROM hys.htd_trabajadoresdifenilos'
      ' WHERE td_idinforme = :IdInforme')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IdInforme'
        ParamType = ptInput
      end>
  end
end
