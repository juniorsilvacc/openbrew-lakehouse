# 🍻 OpenBrew Lakehouse Project
Este projeto implementa uma arquitetura de Data Lakehouse moderna para processar e analisar dados globais de cervejarias utilizando a Open Brewery DB API. O objetivo é transformar dados brutos em insights valiosos através de uma pipeline robusta e escalável.

## 🏗️ Arquitetura
O projeto segue a Medallion Architecture (Arquitetura de Medalhão), garantindo a linhagem e a qualidade dos dados em cada etapa:

- Bronze (Raw): Ingestão dos dados brutos da API em formato JSON/Parquet via Spark.
- Silver (Trusted): Limpeza, padronização de tipos de dados (geolocalização, endereços) e tratamento de valores nulos utilizando Spark e dbt.
- Gold (Refined): Agregações de negócios (ex: densidade de cervejarias por tipo e região) prontas para consumo por ferramentas de BI.

## 🛠️ Tecnologias Utilizadas
- Databricks: Plataforma unificada de análise para execução do cluster Spark.
- Apache Spark: Processamento distribuído para ingestão e transformação de grandes volumes de dados.
- dbt (data build tool): Modelagem de dados, testes de qualidade e documentação da camada semântica.
- Delta Lake: Camada de armazenamento que confere confiabilidade (ACID) ao Lakehouse.
- Python/PySpark: Linguagem principal para os scripts de extração.

## 🚀 Funcionalidades
- Ingestão Automatizada: Script em Python que consome a API de forma eficiente.
- Governança e Testes: dbt Cloud/Core para garantir que campos críticos (como id e name) nunca sejam nulos.
- Escalabilidade: Pronto para lidar com o crescimento da base de dados de cervejarias mundiais.