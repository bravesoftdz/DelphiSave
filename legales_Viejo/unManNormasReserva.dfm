inherited frmManNormasReservas: TfrmManNormasReservas
  Caption = 'Mantenimientos Normas Reservas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'NR_ID'
        Title.Caption = 'ID'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NO_NRO'
        Title.Caption = 'Norma'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NO_DESCRIPCION'
        Title.Caption = 'Desc. Norma'
        Width = 163
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NR_ARTICULO'
        Title.Caption = 'Articulo'
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NR_INCISO'
        Title.Caption = 'Inciso'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NR_APARTADO'
        Title.Caption = 'Apartado'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NR_ANEXO'
        Title.Caption = 'Anexo'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NR_RESERVACAPITAL'
        Title.Caption = 'Reserva Capital'
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_DESCRIPCION'
        Title.Caption = 'Sector'
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NR_VALIDASECTOR'
        Title.Caption = 'Valiuda Sector'
        Width = 116
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Height = 263
    inherited BevelAbm: TBevel
      Top = 227
    end
    object Label1: TLabel [1]
      Left = 13
      Top = 13
      Width = 34
      Height = 13
      Caption = 'Norma:'
    end
    object Label2: TLabel [2]
      Left = 13
      Top = 42
      Width = 38
      Height = 13
      Caption = 'Articulo:'
    end
    object Label3: TLabel [3]
      Left = 13
      Top = 72
      Width = 31
      Height = 13
      Caption = 'Inciso:'
    end
    object Label4: TLabel [4]
      Left = 13
      Top = 99
      Width = 46
      Height = 13
      Caption = 'Apartado:'
    end
    object Label5: TLabel [5]
      Left = 13
      Top = 127
      Width = 33
      Height = 13
      Caption = 'Anexo:'
    end
    object Label6: TLabel [6]
      Left = 13
      Top = 152
      Width = 72
      Height = 13
      Caption = 'Reserv Capital:'
    end
    object Label7: TLabel [7]
      Left = 13
      Top = 181
      Width = 34
      Height = 13
      Caption = 'Sector:'
    end
    inherited btnAceptar: TButton
      Top = 233
    end
    inherited btnCancelar: TButton
      Top = 233
    end
    inline fraNorma: TfraCodigoDescripcion
      Left = 90
      Top = 8
      Width = 357
      Height = 23
      TabOrder = 2
    end
    object edReservaCapital: TCurrencyEdit
      Left = 89
      Top = 150
      Width = 123
      Height = 21
      AutoSize = False
      TabOrder = 7
    end
    object edArticulo: TIntEdit
      Left = 90
      Top = 38
      Width = 121
      Height = 21
      TabOrder = 3
      MaxLength = 0
    end
    object edInciso: TIntEdit
      Left = 90
      Top = 66
      Width = 121
      Height = 21
      TabOrder = 4
      MaxLength = 0
    end
    object edApartado: TIntEdit
      Left = 90
      Top = 95
      Width = 121
      Height = 21
      TabOrder = 5
      MaxLength = 0
    end
    object edAnexo: TIntEdit
      Left = 89
      Top = 124
      Width = 122
      Height = 21
      TabOrder = 6
      MaxLength = 0
    end
    inline fraSector: TfraCodigoDescripcion
      Left = 90
      Top = 176
      Width = 357
      Height = 23
      TabOrder = 8
    end
    object cbValidaSector: TCheckBox
      Left = 11
      Top = 203
      Width = 93
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Valida Sector'
      TabOrder = 9
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT nr_id, nr_idnorma, nr_fechaalta, nr_usualta, nr_reservaca' +
        'pital, nr_idsector, nr_validasector, no_nro, no_descripcion,'
      
        '       nr_articulo, nr_inciso, nr_apartado, nr_anexo, sc_descrip' +
        'cion, nr_fechabaja'
      
        '  FROM legales.lnr_normareserva, art.usc_sectores, legales.lno_n' +
        'orma'
      ' WHERE no_id = nr_idnorma'
      '   AND sc_id = nr_idsector')
  end
end
