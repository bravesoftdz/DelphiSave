unit unStringsLT;

interface
  {SDN}
  const SDN_NOD_ENTRY     = 'sdnEntry';
  const SDN_NOD_LASTNAME  = 'lastName';
  const SDN_NOD_FIRSTNAME = 'firstName';
  const SDN_NOD_ADDR_LIST = 'addressList';
  const SDN_NOD_ADDRESS   = 'address';
  const SDN_NOD_CITY      = 'city';
  const SDN_NOD_COUNTRY   = 'country';


  {GLOBAL}
  const GLOBAL_NOD_ENTITY     = 'ENTITY';
  const GLOBAL_NOD_NAME       = 'NAME';
  const GLOBAL_NOD_LASTNAME   = 'LASTNAME';
  const GLOBAL_NOD_FIRSTNAME  = 'FIRSTNAME';
  const GLOBAL_NOD_MIDLENAME  = 'MIDLENAME';
  const GLOBAL_NOD_WHOLENAME  = 'WHOLENAME';
  const GLOBAL_NOD_ADDRESS    = 'ADDRESS';
  const GLOBAL_NOD_COUNTRY    = 'COUNTRY';
  const GLOBAL_NOD_CITY       = 'CITY';


  {CONSOLIDATED}
  const CONS_NOD_INDIVIDUALS= 'INDIVIDUALS';
  const CONS_NOD_INDIVIDUAL = 'INDIVIDUAL';
  const CONS_NOD_IND_ADDRESS= 'INDIVIDUAL_ADDRESS';

  const CONS_NOD_ENTITIES   = 'ENTITIES';
  const CONS_NOD_ENTITY     = 'ENTITY';
  const CONS_NOD_ENT_ADDRESS= 'ENTITY_ADDRESS';

  const CONS_NOD_FIRSTNAME  = 'FIRST_NAME';
  const CONS_NOD_SECONDNAME = 'SECOND_NAME';
  const CONS_NOD_THIRDNAME  = 'THIRD_NAME';
  const CONS_NOD_FOURTHNAME = 'FOURTH_NAME';
  const CONS_NOD_COMENTS1   = 'COMENTS1';
  const CONS_NOD_DATAID     = 'DATAID';

  const CONS_NOD_COUNTRY    = 'COUNTRY';
  const CONS_NOD_CITY       = 'CITY';
  const CONS_NOD_NOTE       = 'NOTE';

  {COMUNES}
  const NOD_RAIZ          = 'ListadoTerroristasUIF';
  const NOD_ENTIDAD       = 'Entidad';
  const NOD_ND            = 'N/D';
  const PROCESADO         = '_Procesado_';
  const FIELD_NOMBRE      = 'NOMBRE';
  const FIELD_DIRECCION   = 'DIRECCION';
  const XML               = '.xml';
  const TXT               = '.txt';
  const ERROR_PROC_NODO   = 'Error procesando nodo: ';
  const ERROR_TIPO_ARC    = 'No se ha seteado la propiedad TipoArchivoEI del objeto %s de clase TRelevTXTs';
  const CRLF              = #13#10;
  const EVENT_VWR         = CRLF + 'Procesando la clase %s.' + CRLF + 'Archivo %s';
  
implementation

end.
