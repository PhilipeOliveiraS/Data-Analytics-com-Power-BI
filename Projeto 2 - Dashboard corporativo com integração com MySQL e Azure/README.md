# 📊 Painel do Power BI: Caracterização Detalhada da Base de Dados Teste Company

## 📚 Introdução

Este projeto mergulha na caracterização abrangente da base de dados Teste Azure_Company, utilizando a poderosa integração entre o Power BI e um banco de dados MySQL hospedado no Azure. O objetivo principal é fornecer uma análise detalhada dos dados contidos na base de teste, servindo como um protótipo valioso para análises e visualizações. As informações obtidas através deste estudo contribuem significativamente para a avaliação e validação dos processos de integração e transformação de dados.

## 📈 Fonte de Dados

Os dados utilizados neste projeto foram cuidadosamente selecionados a partir de uma base de teste, meticulosamente elaborada para espelhar um cenário realista de dados corporativos. Essa abordagem permite uma análise aprofundada, possibilitando a identificação de padrões e insights relevantes para o contexto da empresa.

**Link do servidor no Azure:** [projetos-powerbi.mysql.database.azure.com](https://projetos-powerbi.mysql.database.azure.com)


## ⚙️ Processamento e Transformação de Dados

Para construir este painel completo, foi implementado um pipeline meticuloso de processamento e transformação de dados, composto pelas seguintes etapas:

1. **Criação de Instância do Azure MySQL:** Uma instância do MySQL foi criada no Azure para servir como repositório central dos dados.
2. **Criação do Banco de Dados:** Seguindo as diretrizes estabelecidas em um script disponível no GitHub, o banco de dados foi criado com sucesso.
3. **Integração do Power BI com MySQL no Azure:** Uma integração perfeita entre o Power BI e o banco de dados MySQL hospedado no Azure foi estabelecida, garantindo a comunicação fluida entre as ferramentas.
4. **Análise Detalhada da Base de Dados:** Um exame minucioso da base de dados foi conduzido para identificar e solucionar possíveis problemas de qualidade dos dados, garantindo a confiabilidade das informações.
5. **Implementação do Processo ETL:** Todo o processo de Extração, Transformação e Carregamento (ETL) foi meticulosamente executado, assegurando a limpeza, consistência e organização dos dados para posterior análise.

## 🛠️ Ferramentas Utilizadas

- **MySQL Workbench:** Utilizado para a criação e gerenciamento do banco de dados MySQL.
- **Power BI:** Utilizado para a criação do relatório e Dashboard interativo para visualizações de dados.
- **Azure:** Hospedagem do banco de dados MySQL.

## 📝 Diretrizes para Transformação de Dados

Para garantir a precisão, confiabilidade e usabilidade dos dados, as seguintes diretrizes de transformação foram rigorosamente seguidas:

1. **Verificação Detalhada de Cabeçalhos e Tipos de Dados:** Os rótulos dos cabeçalhos e os tipos de dados de cada coluna foram cuidadosamente verificados quanto à precisão e consistência, garantindo uma interpretação correta das informações.
2. **Conversão Precisa de Valores Monetários:** Os valores monetários presentes na base de dados foram convertidos para o tipo de dados double preciso(Número decimal fixo), permitindo cálculos precisos e confiáveis.
3. **Análise e Tratamento de Valores Nulos:** A presença e o impacto de valores nulos em cada coluna foram meticulosamente analisados. Estratégias adequadas de manipulação de dados foram implementadas para lidar com esses casos, garantindo a integridade das informações.
4. **Identificação de Funcionários e Gerentes:** Funcionários com valores nulos na coluna 'Super_ssn' foram identificados como potenciais gerentes. Uma análise cruzada foi realizada para garantir que nenhum funcionário ficasse sem um gerente designado.
5. **Verificação da Existência de Gerentes por Departamento:** Para cada departamento na base de dados, a existência de um gerente correspondente foi verificada. Essa etapa garante uma estrutura organizacional completa e bem definida.
6. **Imputação de Gerentes em Departamentos sem Gerentes:** Em casos excepcionais onde departamentos não possuíam um gerente designado, um gerente hipotético foi assumido e seus detalhes imputados na base de dados. Essa etapa visa manter a integridade e a consistência das informações.
7. **Análise Detalhada do Número de Horas dos Projetos:** O número de horas associado a cada projeto foi examinado minuciosamente para identificar anomalias, valores discrepantes ou possíveis erros de digitação.
8. **Decomposição de Colunas Complexas em Unidades Menores:** Colunas com estruturas complexas foram decompostas em unidades menores e mais gerenciáveis, facilitando a análise e a manipulação dos dados.
9. **Mesclagem das Tabelas 'Funcionário' e 'Departamento':** As tabelas 'funcionário' e 'departamento' foram mescladas, criando uma tabela abrangente que vincula cada funcionário ao seu respectivo departamento. Essa etapa foi realizada utilizando a tabela 'funcionário' como fonte primária, garantindo a integridade das informações.
10. **Eliminação de Colunas Redundantes e Desnecessárias:** Colunas que não eram relevantes para a análise ou que apresentavam informações redundantes foram eliminadas da base de dados, otimizando o desempenho e a eficiência das análises subsequentes.
11. **Junção de Colaboradores e Respectivos Gerentes:** Foi realizada a junção dos colaboradores com seus respectivos gerentes, estabelecendo a relação hierárquica entre os funcionários. Essa etapa foi realizada por meio de consultas SQL conforme os comandos abaixo:

    ```sql
    SELECT 
        e.Fname AS EmployeeFirstName,
        e.Minit AS EmployeeMiddleInit,
        e.Lname AS EmployeeLastName,
        e.Ssn AS EmployeeSSN,
        e.Bdate AS EmployeeBirthDate,
        e.Address AS EmployeeAddress,
        e.Sex AS EmployeeSex,
        e.Salary AS EmployeeSalary,
        e.Super_ssn AS EmployeeSuperSSN,
        e.Dno AS EmployeeDeptNumber,
        m.Fname AS ManagerFirstName,
        m.Lname AS ManagerLastName
    FROM 
        employee e
    LEFT JOIN 
        employee m ON e.Super_ssn = m.Ssn;
    ```

12. **Consolidação da Coluna de Nome:** As colunas 'Nome' e 'Sobrenome' foram combinadas em uma única coluna denominada 'Nome', proporcionando uma representação mais simplificada e eficiente dos nomes dos colaboradores.
13. **Criação de Combinações Únicas de Departamento e Localização:** Os nomes dos departamentos e suas respectivas localizações foram combinados, gerando combinações únicas que serão fundamentais para a construção do modelo estrela em etapas futuras.
14. 📝 **Justificativa para o Uso da Função Mesclar:** Uma explicação detalhada sobre a razão pela qual a função mesclar é mais adequada do que a função atribuir no contexto apresentado no print abaixo.

**Justificativa:**

A imagem fornecida apresenta um cenário onde duas tabelas, "Gerente" e "Colaborador", contêm dados de funcionários. A tabela "Gerente" possui colunas para nomes e números de previdência social dos gerentes, enquanto a tabela "Colaborador" possui colunas para nomes, números de previdência social e números de departamento dos funcionários. O objetivo é combinar essas tabelas para criar uma única tabela que inclua informações tanto sobre funcionários quanto sobre gerentes.

Neste cenário, o uso da função "Mesclar" é mais apropriado do que a função "Atribuir" pelas seguintes razões:

1. **Estrutura e Relacionamento de Dados:**
   - As tabelas "Gerente" e "Colaborador" possuem um relacionamento um-para-muitos, o que significa que cada gerente pode ter vários funcionários, mas cada funcionário tem apenas um gerente.
   - A função "Mesclar" foi projetada para lidar com esse tipo de relacionamento de forma eficaz, permitindo combinar linhas de várias tabelas com base em critérios de correspondência.

2. **Junção em Colunas Comuns:**
   - Ambas as tabelas compartilham uma coluna comum, "Mgr_ssn", que representa o número de previdência social do gerente de cada funcionário.
   - A função "Mesclar" se destaca em unir tabelas com base em colunas comuns, permitindo conectar os dados dos funcionários aos dados correspondentes do gerente.

3. **Criação de uma Única Tabela Abrangente:**
   - O objetivo é criar uma única tabela que inclua todas as informações relevantes sobre funcionários e gerentes.
   - A função "Mesclar" permite combinar as colunas relevantes de ambas as tabelas em uma única tabela de saída, atendendo a esse requisito.

4. **Simplicidade e Eficiência:**
   - A função "Mesclar" oferece uma abordagem direta e eficiente para combinar dados de várias tabelas com um relacionamento um-para-muitos.
   - Elimina a necessidade de manipulação complexa de dados ou várias etapas para alcançar o resultado desejado.

Em contraste, a função "Atribuir" é usada principalmente para atribuir valores de uma tabela para outra com base em condições específicas. Não é tão adequada para combinar várias tabelas com um relacionamento um-para-muitos.

**Conclusão:**

Para o cenário fornecido de combinar dados de funcionários e gerentes de duas tabelas com um relacionamento um-para-muitos, a função "Mesclar" é a escolha mais apropriada e eficiente. Ela lida efetivamente com a estrutura de dados, junta em colunas comuns, cria uma tabela de saída abrangente e oferece uma abordagem direta.


15. **Agrupamento de Colaboradores por Gerente:** Os dados foram agrupados para determinar o número de colaboradores sob a responsabilidade de cada gerente, fornecendo uma visão geral da estrutura organizacional.
16. **Eliminação de Colunas Desnecessárias:** Colunas que não apresentavam relevância para o relatório final foram eliminadas, otimizando o conjunto de dados e facilitando a análise.

## 🛠️ Construção do Dashboard

Com base nos dados transformados e enriquecidos, foi construído um painel informativo e visualmente atraente no Power BI. O painel apresenta uma série de visualizações que permitem uma análise profunda dos dados, destacando insights relevantes para a empresa.

**Link do Dashboard:** [Power BI Dashboard](https://app.powerbi.com/groups/me/reports/d1bed8db-ca3b-4d15-bc6b-231f38f6ee53/ReportSection?experience=power-bi)

### 📊 Elementos Visuais Sugeridos

- **Distribuição de Homens e Mulheres entre os Departamentos:** Visualize a distribuição de gênero em diferentes departamentos para verificar a proximidade e diversidade.
- **Desempenho por Departamento:** Analise o desempenho de cada departamento em termos de produtividade e eficiência.
- **Localização dos Departamentos:** Mapeie a distribuição geográfica dos departamentos para entender a logística e a alocação de recursos.
- **Relação entre Gerentes e Funcionários:** Visualize a hierarquia organizacional, mostrando a relação entre gerentes e seus subordinados.
- **Análise de Salários:** Compare os salários dos funcionários dentro e entre os departamentos para identificar disparidades ou áreas para ajustes.

## 📌 Badges

![SQL](https://img.shields.io/badge/SQL-MySQL-blue)
![Power BI](https://img.shields.io/badge/Power%20BI-Visualização-yellow)
![Azure](https://img.shields.io/badge/Azure-Cloud-blue)
![License](https://img.shields.io/badge/License-MIT-green)

---

## 🚀 Conclusão

Este projeto representa um passo importante na caracterização da base de dados da Teste Company, fornecendo uma base sólida para futuras análises e tomadas de decisão. O painel desenvolvido oferece uma visão abrangente dos dados, permitindo identificar oportunidades de melhoria e otimização dos processos.

