import subprocess
import time

SCR_SCRIPT = "scr.py"  # Nome do seu script principal

# Função para executar o script principal
def run_main_script():
    try:
        subprocess.run(["python3", SCR_SCRIPT])  # Executa o script principal
    except Exception as e:
        print(f"Erro ao executar o script principal: {e}")

# Função para monitorar e reiniciar o script principal
def monitor_script(interval_restart):
    while True:
        try:
            print(f"Iniciando {SCR_SCRIPT}...")
            run_main_script()  # Executa o script principal
        except Exception as e:
            print(f"Erro ao executar {SCR_SCRIPT}: {e}")
        
        print(f"Aguardando {interval_restart} segundos para reiniciar {SCR_SCRIPT}...")
        time.sleep(interval_restart)  # Espera o intervalo especificado antes de reiniciar

# Intervalo para reiniciar o script principal (em segundos)
interval_restart = 1 * 60 * 60 + 5 * 60  # 1 hora + 5 minutos = 3900 segundos

if __name__ == "__main__":
    monitor_script(interval_restart)