import re
def parsear_timestamp(timestamp_str):
    """
    Convierte timestamp de formato '29/Jan/2023:03:50:28' 
    a formato estándar '29-01-2023 03:50:28'
    """
    # Mapeo de meses en inglés a números
    meses = {
        'Jan': '01', 'Feb': '02', 'Mar': '03', 'Apr': '04',
        'May': '05', 'Jun': '06', 'Jul': '07', 'Aug': '08',
        'Sep': '09', 'Oct': '10', 'Nov': '11', 'Dec': '12'
    }
    
    # Usar regex para extraer componentes: 29/Jan/2023:03:50:28
    pattern = r'(\d{1,2})/(\w{3})/(\d{4}):(\d{2}):(\d{2}):(\d{2})'
    match = re.match(pattern, timestamp_str)
    
    if match:
        dia, mes_str, anio, hora, minuto, segundo = match.groups()
        mes_num = meses.get(mes_str, '01')  # Default a enero si no encuentra el mes
        
        # Formato estándar: YYYY-MM-DD HH:MM:SS
        return f"{anio}-{mes_num}-{dia.zfill(2)} {hora}:{minuto}:{segundo}"
    else:
        return None
    