object fraVolantes: TfraVolantes
  Left = 0
  Top = 0
  Width = 658
  Height = 121
  TabOrder = 0
  DesignSize = (
    658
    121)
  object Label1: TLabel
    Left = 1
    Top = 5
    Width = 62
    Height = 13
    Caption = 'Nro. Volante:'
  end
  object Label4: TLabel
    Left = 398
    Top = 5
    Width = 40
    Height = 13
    Caption = 'R.Social'
  end
  object lbPrestIdentif: TLabel
    Left = 307
    Top = 5
    Width = 35
    Height = 13
    Caption = 'Identif.:'
  end
  object Label5: TLabel
    Left = 237
    Top = 5
    Width = 22
    Height = 13
    Caption = 'Sec.'
  end
  object Label6: TLabel
    Left = 125
    Top = 5
    Width = 25
    Height = 13
    Caption = 'CUIT'
  end
  object Label2: TLabel
    Left = 24
    Top = 30
    Width = 39
    Height = 13
    Caption = 'Factura:'
  end
  object Label3: TLabel
    Left = 164
    Top = 30
    Width = 30
    Height = 13
    Caption = 'Fecha'
  end
  object Label7: TLabel
    Left = 272
    Top = 30
    Width = 75
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Total Facturado'
  end
  object Label8: TLabel
    Left = 27
    Top = 54
    Width = 36
    Height = 13
    Caption = 'Estado:'
  end
  object Label9: TLabel
    Left = 23
    Top = 77
    Width = 40
    Height = 13
    Caption = 'Observ.:'
  end
  object Label10: TLabel
    Left = 426
    Top = 30
    Width = 51
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Ing.Brutos:'
  end
  object Label11: TLabel
    Left = 541
    Top = 30
    Width = 57
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Imp. D'#233'bito:'
  end
  object Label12: TLabel
    Left = 4
    Top = 100
    Width = 59
    Height = 13
    Caption = 'Obs. Debito:'
  end
  object Label13: TLabel
    Left = 485
    Top = 54
    Width = 53
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Contr. ART'
  end
  object Label14: TLabel
    Left = 558
    Top = 54
    Width = 52
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Contr. Mut.'
  end
  object Label15: TLabel
    Left = 630
    Top = 54
    Width = 25
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Mixto'
  end
  object edEstado: TEdit
    Left = 65
    Top = 50
    Width = 404
    Height = 21
    TabStop = False
    Anchors = [akLeft, akTop, akRight]
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 12
  end
  object edPrestRSocial: TEdit
    Left = 442
    Top = 1
    Width = 215
    Height = 21
    TabStop = False
    Anchors = [akLeft, akTop, akRight]
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 4
  end
  object mskPrestCUIT: TMaskEdit
    Left = 153
    Top = 1
    Width = 81
    Height = 21
    Hint = 'CUIT o Clave del Prestador'
    TabStop = False
    Color = clBtnFace
    EditMask = '##-########-C;0;_'
    MaxLength = 13
    ReadOnly = True
    TabOrder = 1
  end
  object edFacTipo: TEdit
    Left = 65
    Top = 26
    Width = 13
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 5
  end
  object edFacEstab: TEdit
    Left = 77
    Top = 26
    Width = 30
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 6
  end
  object edFacNro: TEdit
    Left = 106
    Top = 26
    Width = 55
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 7
  end
  object edFecha: TEdit
    Left = 200
    Top = 26
    Width = 69
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 8
    Text = '__/__/____'
  end
  object edObservaciones: TMemo
    Left = 65
    Top = 73
    Width = 592
    Height = 21
    TabStop = False
    Anchors = [akLeft, akTop, akRight]
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 13
  end
  object edPrestSecuencia: TEdit
    Left = 259
    Top = 1
    Width = 45
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 2
  end
  object edTotFact: TCurrencyEdit
    Left = 351
    Top = 26
    Width = 69
    Height = 21
    TabStop = False
    AutoSize = False
    Color = clBtnFace
    Anchors = [akTop, akRight]
    ReadOnly = True
    TabOrder = 11
  end
  object edNumero: TIntEdit
    Left = 65
    Top = 1
    Width = 57
    Height = 21
    TabOrder = 0
    OnExit = edNumeroExit
    OnKeyPress = edNumeroKeyPress
    MaxLength = 8
  end
  object edPrestIdentif: TIntEdit
    Left = 343
    Top = 1
    Width = 45
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 3
  end
  object edVO_MONTOPERCEPCION: TCurrencyEdit
    Left = 480
    Top = 26
    Width = 56
    Height = 21
    TabStop = False
    AutoSize = False
    Color = clBtnFace
    Anchors = [akTop, akRight]
    ReadOnly = True
    TabOrder = 9
  end
  object edVO_MONTODEBITO: TCurrencyEdit
    Left = 601
    Top = 26
    Width = 56
    Height = 21
    TabStop = False
    AutoSize = False
    Color = clBtnFace
    Anchors = [akTop, akRight]
    ReadOnly = True
    TabOrder = 10
  end
  object edVO_OBSERVACIONDEBITO: TMemo
    Left = 65
    Top = 96
    Width = 592
    Height = 21
    TabStop = False
    Anchors = [akLeft, akTop, akRight]
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 14
  end
  object chContratoART: TCheckBox
    Left = 470
    Top = 52
    Width = 15
    Height = 17
    Anchors = [akTop, akRight]
    Enabled = False
    TabOrder = 15
  end
  object chContratoMutual: TCheckBox
    Left = 543
    Top = 52
    Width = 14
    Height = 17
    Anchors = [akTop, akRight]
    Enabled = False
    TabOrder = 16
  end
  object chMixto: TCheckBox
    Left = 615
    Top = 52
    Width = 14
    Height = 15
    Anchors = [akTop, akRight]
    Enabled = False
    TabOrder = 17
  end
  object sdqBusqueda: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT'
      '        VO_VOLANTE,'
      '        CA_CLAVE,'
      '        CA_DESCRIPCION,'
      '        CA_SECUENCIA,'
      '        CA_IDENTIFICADOR,'
      '        CA_CONTRATO,'
      '        CA_CONTRATOMUTUAL,'
      '        VO_FACTURATIPO,'
      '        VO_FACTURAESTABLE,'
      '        VO_FACTURANRO,'
      '        VO_FECHAFACTURA,'
      '        VO_MONTO,'
      '        VO_VENCIMIENTO,'
      '        VO_OBSERVACIONES,'
      '        VO_ESTADO,'
      '        VO_ESTADOPEND,'
      '        TB_DESCRIPCION ESTADO,'
      '        VO_FACPEN,'
      '        (VO_MONTO - VO_FACPEN) DIFERENCIA,'
      '        VO_USUAPRO,'
      '        VO_FECHAPRO,'
      '        VO_AJUSTE,'
      '        VO_MONTOPERCEPCION,'
      '        VO_MONTODEBITO,'
      '        VO_OBSERVACIONDEBITO,'
      '        VO_NOREQUIEREAUDI,'
      '        VO_AUDITADO,'
      '        VO_MIXTO'
      'FROM CPR_PRESTADOR, CTB_TABLAS, SVO_VOLANTES'
      'WHERE VO_PRESTADOR = CA_IDENTIFICADOR (+)'
      'AND TB_CLAVE (+) = '#39'MUVOL'#39' '
      'AND TB_CODIGO (+) = VO_ESTADO  '
      ''
      ''
      ' '
      ' ')
    Left = 85
    Top = 65531
    object sdqBusquedaVO_VOLANTE: TFloatField
      FieldName = 'VO_VOLANTE'
      Required = True
    end
    object sdqBusquedaCA_CLAVE: TStringField
      FieldName = 'CA_CLAVE'
      Size = 11
    end
    object sdqBusquedaCA_DESCRIPCION: TStringField
      FieldName = 'CA_DESCRIPCION'
      Size = 150
    end
    object sdqBusquedaCA_SECUENCIA: TFloatField
      FieldName = 'CA_SECUENCIA'
    end
    object sdqBusquedaCA_IDENTIFICADOR: TFloatField
      FieldName = 'CA_IDENTIFICADOR'
    end
    object sdqBusquedaVO_FACTURATIPO: TStringField
      FieldName = 'VO_FACTURATIPO'
      Required = True
      Size = 1
    end
    object sdqBusquedaVO_FACTURAESTABLE: TStringField
      FieldName = 'VO_FACTURAESTABLE'
      Required = True
      Size = 4
    end
    object sdqBusquedaVO_FACTURANRO: TStringField
      FieldName = 'VO_FACTURANRO'
      Required = True
      Size = 8
    end
    object sdqBusquedaVO_FECHAFACTURA: TDateTimeField
      FieldName = 'VO_FECHAFACTURA'
      Required = True
    end
    object sdqBusquedaVO_MONTO: TFloatField
      FieldName = 'VO_MONTO'
      Required = True
    end
    object sdqBusquedaVO_VENCIMIENTO: TDateTimeField
      FieldName = 'VO_VENCIMIENTO'
      Required = True
    end
    object sdqBusquedaVO_OBSERVACIONES: TStringField
      FieldName = 'VO_OBSERVACIONES'
      Size = 250
    end
    object sdqBusquedaVO_ESTADO: TStringField
      DisplayWidth = 3
      FieldName = 'VO_ESTADO'
      Required = True
      Size = 3
    end
    object sdqBusquedaESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 150
    end
    object sdqBusquedaVO_FACPEN: TFloatField
      FieldName = 'VO_FACPEN'
    end
    object sdqBusquedaDIFERENCIA: TFloatField
      FieldName = 'DIFERENCIA'
      Required = True
    end
    object sdqBusquedaVO_USUAPRO: TStringField
      FieldName = 'VO_USUAPRO'
    end
    object sdqBusquedaVO_FECHAPRO: TDateTimeField
      FieldName = 'VO_FECHAPRO'
    end
    object sdqBusquedaVO_AJUSTE: TFloatField
      FieldName = 'VO_AJUSTE'
    end
    object sdqBusquedaVO_MONTOPERCEPCION: TFloatField
      FieldName = 'VO_MONTOPERCEPCION'
      Required = True
    end
    object sdqBusquedaVO_MONTODEBITO: TFloatField
      FieldName = 'VO_MONTODEBITO'
      Required = True
    end
    object sdqBusquedaCA_CONTRATO: TStringField
      FieldName = 'CA_CONTRATO'
      Size = 1
    end
    object sdqBusquedaCA_CONTRATOMUTUAL: TStringField
      FieldName = 'CA_CONTRATOMUTUAL'
      Size = 1
    end
    object sdqBusquedaVO_OBSERVACIONDEBITO: TStringField
      FieldName = 'VO_OBSERVACIONDEBITO'
      Size = 1000
    end
    object sdqBusquedaVO_NOREQUIEREAUDI: TStringField
      FieldName = 'VO_NOREQUIEREAUDI'
      Required = True
      Size = 1
    end
    object sdqBusquedaVO_AUDITADO: TStringField
      FieldName = 'VO_AUDITADO'
      Required = True
      Size = 1
    end
    object sdqBusquedaVO_MIXTO: TStringField
      FieldName = 'VO_MIXTO'
      Size = 1
    end
    object sdqBusquedaVO_ESTADOPEND: TStringField
      FieldName = 'VO_ESTADOPEND'
      Size = 3
    end
  end
end
