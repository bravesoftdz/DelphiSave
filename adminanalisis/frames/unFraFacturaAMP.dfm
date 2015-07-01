inherited fraFacturaAMP: TfraFacturaAMP
  Width = 663
  Height = 95
  OnExit = FrameExit
  object lbNroVolante: TLabel [0]
    Left = 16
    Top = 5
    Width = 62
    Height = 13
    Caption = 'Nro. Volante:'
  end
  object lbRSocial: TLabel [1]
    Left = 344
    Top = 5
    Width = 40
    Height = 13
    Caption = 'R.Social'
  end
  object lbPrestIdentif: TLabel [2]
    Left = 253
    Top = 5
    Width = 35
    Height = 13
    Caption = 'Identif.:'
  end
  object lbCuit: TLabel [3]
    Left = 139
    Top = 5
    Width = 25
    Height = 13
    Caption = 'CUIT'
  end
  object lbFactura: TLabel [4]
    Left = 38
    Top = 30
    Width = 39
    Height = 13
    Caption = 'Factura:'
  end
  object lbFecha: TLabel [5]
    Left = 178
    Top = 30
    Width = 30
    Height = 13
    Caption = 'Fecha'
  end
  object lbTotalFacturado: TLabel [6]
    Left = 291
    Top = 30
    Width = 75
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Total Facturado'
  end
  object lbEstado: TLabel [7]
    Left = 41
    Top = 54
    Width = 36
    Height = 13
    Caption = 'Estado:'
  end
  object lbObservaciones: TLabel [8]
    Left = 3
    Top = 77
    Width = 74
    Height = 13
    Caption = 'Observaciones:'
  end
  object lbIngBrutos: TLabel [9]
    Left = 440
    Top = 30
    Width = 51
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Ing.Brutos:'
  end
  object lbImpDebito: TLabel [10]
    Left = 551
    Top = 30
    Width = 57
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Imp. Débito:'
  end
  object edESTADO: TEdit [11]
    Left = 78
    Top = 50
    Width = 585
    Height = 21
    TabStop = False
    Anchors = [akLeft, akTop, akRight]
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 0
  end
  object edPR_NOMBRE: TEdit [12]
    Left = 388
    Top = 1
    Width = 275
    Height = 21
    TabStop = False
    Anchors = [akLeft, akTop, akRight]
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 1
  end
  object edPR_CUIT: TMaskEdit [13]
    Left = 167
    Top = 1
    Width = 81
    Height = 21
    Hint = 'CUIT o Clave del Prestador'
    TabStop = False
    Color = clBtnFace
    EditMask = '##-########-C;0;_'
    MaxLength = 13
    ReadOnly = True
    TabOrder = 2
  end
  object edFM_FACTURATIPO: TEdit [14]
    Left = 79
    Top = 26
    Width = 13
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 3
  end
  object edFM_FACTURAESTABLE: TEdit [15]
    Left = 91
    Top = 26
    Width = 30
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 4
  end
  object edFM_FACTURANRO: TEdit [16]
    Left = 120
    Top = 26
    Width = 55
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 5
  end
  object edFM_FECHAFACTURA: TEdit [17]
    Left = 214
    Top = 26
    Width = 69
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 6
    Text = '__/__/____'
  end
  object edFM_OBSERVACION: TMemo [18]
    Left = 78
    Top = 73
    Width = 585
    Height = 21
    TabStop = False
    Anchors = [akLeft, akTop, akRight, akBottom]
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 7
  end
  object edFM_MONTO: TCurrencyEdit [19]
    Left = 368
    Top = 26
    Width = 69
    Height = 21
    TabStop = False
    AutoSize = False
    Color = clBtnFace
    Anchors = [akTop, akRight]
    ReadOnly = True
    TabOrder = 8
  end
  object edFM_FACTURAID: TIntEdit [20]
    Left = 79
    Top = 1
    Width = 57
    Height = 21
    TabOrder = 9
    OnKeyPress = edFM_FACTURAIDKeyPress
    MaxLength = 8
  end
  object edPR_CODIGO: TIntEdit [21]
    Left = 289
    Top = 1
    Width = 45
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 10
  end
  object edFM_MONTOPERCEPCION: TCurrencyEdit [22]
    Left = 494
    Top = 26
    Width = 54
    Height = 21
    TabStop = False
    AutoSize = False
    Color = clBtnFace
    Anchors = [akTop, akRight]
    ReadOnly = True
    TabOrder = 11
  end
  object edFM_MONTODEBITO: TCurrencyEdit [23]
    Left = 609
    Top = 26
    Width = 54
    Height = 21
    TabStop = False
    AutoSize = False
    Color = clBtnFace
    Anchors = [akTop, akRight]
    ReadOnly = True
    TabOrder = 12
  end
  inherited sdqDatos: TSDQuery
    SQL.Strings = (
      'SELECT PR_CUIT, PR_CODIGO, PR_NOMBRE,'
      
        '       FM_FACTURATIPO, FM_FACTURAESTABLE, FM_FACTURANRO, FM_FECH' +
        'AFACTURA,'
      '       FM_MONTO, FM_MONTOPERCEPCION, FM_MONTODEBITO,'
      
        '       TB_DESCRIPCION || '#39'( $'#39' || TO_CHAR(FM_MONTO - FM_MONTODEB' +
        'ITO - FM_MONTOPERCEPCION) || '#39' ) ( A Pagar: $'#39' || TO_CHAR(FM_FAC' +
        'PEN) || '#39' )'#39' ESTADO,'
      
        '       (FM_MONTO - FM_MONTODEBITO - FM_MONTOPERCEPCION - FM_FACP' +
        'EN) APAGAR,'
      '       FM_OBSERVACION, FM_ESTADO'
      '  FROM EFM_FACTURAMEDLABORAL, APR_PRESTADORES, CTB_TABLAS'
      ' WHERE FM_PRESTADOR = PR_CODIGO'
      '   AND FM_ESTADO = TB_CODIGO'
      '   AND TB_CLAVE = '#39'ESFAC'#39
      '   AND FM_FACTURAID = :pFactura'
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 404
    Top = 0
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pFactura'
        ParamType = ptInput
      end>
  end
  inherited dsDatos: TDataSource
    Left = 432
    Top = 0
  end
end
