#!/bin/bash

> /var/log/tempo_indisponibilidade.log

# Defina o período de monitoramento em horas (por exemplo, um mês)
PERIODO_DE_MONITORAMENTO_HORAS=720  # 30 dias × 24 horas/dia

# Arquivo de logs de tempo de indisponibilidade (ajuste conforme necessário)
LOG_TEMPO_INDISPONIBILIDADE="/var/log/tempo_indisponibilidade.log"

# Função para calcular o tempo total de indisponibilidade
calcular_tempo_indisponibilidade() {
            # Aqui você pode implementar a lógica para ler o tempo de indisponibilidade do arquivo de log
                # Por exemplo, somar os registros de tempo de inatividade do arquivo de log
                    # Este é um exemplo simples, substitua com lógica real baseada nos seus registros de tempo de inatividade
                        tempo_indisponibilidade=$(cat "$LOG_TEMPO_INDISPONIBILIDADE" | awk '{ sum += $1 } END { print sum }')
                            echo "$tempo_indisponibilidade"
                    }

            # Função para calcular o percentual de disponibilidade
            calcular_disponibilidade() {
                        tempo_total=$PERIODO_DE_MONITORAMENTO_HORAS
                            tempo_indisponibilidade=$(calcular_tempo_indisponibilidade)

                                # Calcular tempo de disponibilidade
                                    tempo_disponibilidade=$((tempo_total - tempo_indisponibilidade))

                                        # Calcular percentual de disponibilidade
                                            if [[ $tempo_total -gt 0 ]]; then
                                                            percentual_disponibilidade=$(echo "scale=2; ($tempo_disponibilidade / $tempo_total) * 100" | bc)
                                                                else
                                                                                percentual_disponibilidade=0
                                                                                    fi

                                                                                        echo "Tempo total de monitoramento: $tempo_total horas"
                                                                                            echo "Tempo de indisponibilidade: $tempo_indisponibilidade horas"
                                                                                                echo "Tempo de disponibilidade: $tempo_disponibilidade horas"
                                                                                                    echo "Percentual de disponibilidade: $percentual_disponibilidade%"
                                                                                            }

                                                                                    # Chamada da função para calcular a disponibilidade
                                                                                    calcular_disponibilidade
