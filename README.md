# Laboratorio de Seguridad: Detección y Respuesta Automatizada (SOAR) con ChatOps

Este proyecto implementa un laboratorio de seguridad avanzado diseñado para detectar actividades maliciosas en red, centralizar registros y ejecutar respuestas automáticas mediante una arquitectura **SOAR** (Security Orchestration, Automation and Response), integrando la colaboración humana en tiempo real a través de **Slack**.

---

## 🎯 Objetivo

El objetivo principal es construir un sistema de defensa activa capaz de:
1.  **Detectar** amenazas complejas (escaneos de red, ataques dirigidos) en tiempo real.
2.  **Responder** de forma automática bloqueando al atacante y protegiendo a la víctima mediante aislamiento dinámico.
3.  **Coordinar** la respuesta del equipo de seguridad mediante una plataforma de comunicación empresarial (ChatOps).

---

## 🏗️ Arquitectura del Laboratorio

El laboratorio se compone de tres máquinas virtuales interconectadas en una red aislada (`10.0.0.0/8`):

*   **Máquina Atacante (Kali Linux - `10.0.0.1`):** Utilizada para realizar escaneos de puertos (Nmap) y lanzamientos de ataques para probar la eficacia del sistema.
*   **Máquina Víctima (Debian/Ubuntu - `10.0.0.3`):** El activo a proteger, monitorizado por un agente de Wazuh y gestionado remotamente por Ansible para bloqueos de emergencia.
*   **Servidor de Defensa (Debian/Ubuntu - `10.0.0.2`):** El "cerebro" del sistema, que aloja:
    *   **Wazuh:** SIEM/XDR encargado de la correlación de eventos y gestión de alertas.
    *   **Suricata:** IDS/NIDS que analiza el tráfico de red en busca de firmas de ataque (escaneos, DoS, etc.).
    *   **Ansible:** Orquestador SOAR que ejecuta Playbooks de contención inmediata.
    *   **Slack API:** Integración para notificaciones críticas y triaje colaborativo.

---

## ⚙️ Flujo de Trabajo y Funcionalidades

### 1. Detección y Defensa Automática (SOAR)
*   **Detección Avanzada:** Suricata identifica patrones maliciosos que van desde simples pings hasta escaneos de puertos complejos.
*   **Bloqueo Dual Inmediato:** Ante alertas críticas, Wazuh activa Ansible para aplicar reglas de `iptables`. El sistema bloquea la IP del atacante y, simultáneamente, refuerza la seguridad de la víctima para evitar desplazamientos laterales.

### 2. ChatOps: Colaboración en Slack
*   **Canales por Severidad:** Las alertas se clasifican y envían a diferentes canales de Slack según su nivel de importancia, simulando un entorno SOC profesional.
*   **Triaje con Emojis (👀):** Los analistas de seguridad marcan las alertas en revisión con el emoji de "ojos".
*   **Bot de Alertas Destacadas:** Un bot programado monitoriza estas reacciones; cuando una alerta es marcada, se destaca automáticamente en un canal de "Alta Prioridad" para garantizar que el equipo de ciberseguridad le dé atención inmediata.

---

## 📦 Tecnologías Clave

*   **SIEM/XDR:** Wazuh
*   **IDS/NIDS:** Suricata
*   **Automatización (SOAR):** Ansible
*   **Comunicación (ChatOps):** Slack API & Webhooks
*   **Virtualización:** VirtualBox

---

## 📚 Bibliografía y Soporte de IA

Este proyecto ha contado con una fase intensiva de investigación y desarrollo apoyada por **Inteligencia Artificial Generativa** foros, videos de Youtube... centradas en:
*   **Depuración de Scripts:** Lógica en Bash y Python.
*   **Hardening de Configuración:** Modificación de archivos y gestión de reglas
*   **Orquestación:** Diseño de Playbooks de Ansible, Wazuh y suricata para la contención de incidentes.
*   **Integración de APIs:** Conexión de flujos de trabajo entre el SIEM y plataformas de mensajería externa.

---

## 📄 Licencia
Este proyecto se ha desarrollado como parte de un trabajo académico (TFG).
