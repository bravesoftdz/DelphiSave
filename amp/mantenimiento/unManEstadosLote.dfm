inherited frmManEstadosLote: TfrmManEstadosLote
  Left = 213
  Top = 153
  Height = 461
  Caption = 'Mantenimiento de Estados de Lotes'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Height = 1
  end
  inherited CoolBar: TCoolBar
    Top = 1
  end
  inherited Grid: TArtDBGrid
    Top = 30
    Height = 404
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'de_codigo'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Width = 38
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'de_valor'
        Title.Alignment = taCenter
        Title.Caption = 'Valor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'de_descripcion'
        Title.Caption = 'Descripci'#243'n'
        Width = 250
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'tipo_estado'
        Title.Alignment = taCenter
        Title.Caption = 'Tipo'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'deriva_descripcion'
        Title.Caption = 'Deriva de'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'recupera'
        Title.Caption = 'Recup.F.Ult.Pres.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'visualizado'
        Title.Caption = 'Ver en Seg.Est.'
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'recalcula'
        Title.Caption = 'Recalc.Fecha Pr'#243'x.Op.'
        Width = 119
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 32
    Top = 171
    Width = 428
    Height = 217
    BorderStyle = bsDialog
    inherited BevelAbm: TBevel
      Top = 181
      Width = 420
    end
    object Label1: TLabel [1]
      Left = 6
      Top = 12
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel [2]
      Left = 6
      Top = 36
      Width = 56
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    object Label3: TLabel [3]
      Left = 9
      Top = 90
      Width = 91
      Height = 13
      Caption = 'Valor agrupamiento'
    end
    inherited btnAceptar: TButton
      Left = 267
      Top = 187
      TabOrder = 8
    end
    inherited btnCancelar: TButton
      Left = 348
      Top = 187
      TabOrder = 9
    end
    inline fraEstadoBase: TfraCodigoDescripcion
      Left = 110
      Top = 57
      Width = 310
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      inherited cmbDescripcion: TArtComboBox
        Left = 66
        Width = 243
      end
    end
    object edCodigo: TEdit
      Left = 66
      Top = 9
      Width = 40
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 2
      TabOrder = 0
    end
    object edDescripcion: TEdit
      Left = 66
      Top = 33
      Width = 352
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
    end
    object rgTipoEstado: TRadioGroup
      Left = 228
      Top = 81
      Width = 190
      Height = 37
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Tipo de Estado '
      Columns = 2
      Items.Strings = (
        'Activo'
        'Inactivo')
      TabOrder = 5
    end
    object chbDerivado: TCheckBox
      Left = 6
      Top = 60
      Width = 100
      Height = 17
      Caption = 'Estado derivado'
      TabOrder = 2
      OnClick = chbDerivadoClick
    end
    object edValor: TRxCalcEdit
      Left = 111
      Top = 87
      Width = 49
      Height = 21
      AutoSize = False
      ButtonWidth = 0
      NumGlyphs = 2
      TabOrder = 4
    end
    object chbVerSegEst: TCheckBox
      Left = 6
      Top = 123
      Width = 169
      Height = 17
      Caption = 'Visualizar en Seg. de Estudios'
      TabOrder = 6
      OnClick = chbVerSegEstClick
    end
    object chbRecupUltPres: TCheckBox
      Left = 6
      Top = 141
      Width = 190
      Height = 17
      Caption = 'Recupera fecha '#250'ltimo presupuesto'
      TabOrder = 7
    end
    object chbRecalculaFecha: TCheckBox
      Left = 6
      Top = 159
      Width = 190
      Height = 17
      Caption = 'Recalcula fecha pr'#243'ximo operativo'
      TabOrder = 10
      OnClick = chbRecalculaFechaClick
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT   de_id, de_codigo, de_descripcion, de_fechabaja, de_valo' +
        'r,'
      '         de_tipoestado, de_versegestudio, de_recuperaultpresup,'
      '         de_recalculafechaproxop,'
      
        '         DECODE(de_tipoestado, '#39'I'#39', '#39'Inactivo'#39', '#39'Activo'#39') tipo_e' +
        'stado,'
      '         DECODE(de_versegestudio, '#39'S'#39', '#39'SI'#39', '#39'NO'#39') visualizado,'
      '         DECODE(de_recuperaultpresup, '#39'S'#39', '#39'SI'#39', '#39'NO'#39') recupera,'
      
        '         DECODE(de_recalculafechaproxop, '#39'S'#39', '#39'SI'#39', '#39'NO'#39') recalc' +
        'ula,'
      '         CASE'
      
        '           WHEN de_valor > TRUNC(de_valor) THEN (SELECT hd2.de_c' +
        'odigo'
      
        '                                                   FROM hys.hde_' +
        'descripcionestadolote hd2'
      
        '                                                  WHERE hd2.de_v' +
        'alor ='
      '                                                          TRUNC'
      
        '                                                            (hde' +
        '.de_valor))'
      '           ELSE NULL'
      '         END deriva_codigo,'
      '         CASE'
      
        '           WHEN de_valor > TRUNC(de_valor) THEN (SELECT hd2.de_d' +
        'escripcion'
      
        '                                                   FROM hys.hde_' +
        'descripcionestadolote hd2'
      
        '                                                  WHERE hd2.de_v' +
        'alor ='
      '                                                          TRUNC'
      
        '                                                            (hde' +
        '.de_valor))'
      '           ELSE NULL'
      '         END deriva_descripcion'
      '    FROM hys.hde_descripcionestadolote hde'
      'ORDER BY de_valor')
    Left = 16
    Top = 76
  end
  inherited dsConsulta: TDataSource
    Left = 44
    Top = 76
  end
  inherited SortDialog: TSortDialog
    SortFields = <
      item
        Title = 'Descripci'#243'n Beneficiario'
        DataField = 'bp_descripcion'
        FieldIndex = 0
      end
      item
        Title = 'Descripci'#243'n Concepto'
        DataField = 'cp_denpago'
        FieldIndex = 1
      end
      item
        FieldIndex = 2
      end>
    Left = 16
    Top = 104
  end
  inherited ExportDialog: TExportDialog
    Left = 44
    Top = 104
  end
  inherited QueryPrint: TQueryPrint
    Left = 44
    Top = 132
  end
  inherited Seguridad: TSeguridad
    Left = 15
    Top = 48
  end
  inherited FormStorage: TFormStorage
    Left = 44
    Top = 48
  end
  inherited PrintDialog: TPrintDialog
    Left = 16
    Top = 132
  end
  inherited ShortCutControl: TShortCutControl
    Left = 72
    Top = 48
  end
  inherited FieldHider: TFieldHider
    Left = 72
    Top = 76
  end
end
