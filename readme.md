# 🚀 Desafio Terraform - Infra AWS

![Terraform](https://img.shields.io/badge/Terraform-623CE4?logo=terraform&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-FF9900?logo=amazon-aws&logoColor=white)
![Status](https://img.shields.io/badge/Status-Done-brightgreen)

Infraestrutura AWS provisionada com Terraform:

- ✅ VPC com subnets públicas e privadas  
- ✅ Instâncias EC2 privadas  
- ✅ Application Load Balancer (ALB)  
- ✅ Target Group e Listener  
- ✅ NAT Gateway e Internet Gateway  
- ✅ Rotas, Security Groups e ACLs

---

## 🏗 Arquitetura

 <img width="216" height="709" alt="image" src="https://github.com/user-attachments/assets/aebeac30-6678-41aa-bb9c-622a6db14591" />


- **ALB**: recebe tráfego HTTP externo.  
- **Target Group**: conecta ALB às EC2 privadas.  
- **EC2 privadas**: acessam a internet via NAT Gateway.  
- **Security Groups**: ALB permite HTTP 80 de todos; EC2 aceita apenas tráfego do ALB.

---

## 📂 Estrutura Terraform

main.tf # Inicializa módulos e recursos
modules/
├─ vpc/ # VPC, subnets, rotas, IGW, NAT, SG
├─ ec2/ # Instâncias EC2 privadas
└─ lb/ # ALB, Listener, Target Group


---

## 🔹 Recursos Provisionados

| Recurso             | Qtde | Observações                  |
|--------------------|------|-----------------------------|
| VPC                 | 1    | CIDR `10.0.0.0/16`          |
| Subnets Públicas    | 2    | Uma por AZ                  |
| Subnets Privadas    | 2    | Uma por AZ                  |
| EC2                 | 2    | `t2.micro`                  |
| ALB                 | 1    | HTTP 80                     |
| Target Group        | 1    | HTTP 80                     |
| NAT Gateway         | 1    | Saída para internet         |
| IGW                 | 1    | Conecta VPC à internet      |
| Security Groups     | 2    | ALB e EC2                   |

---

## ⚡ Comandos Terraform

```bash
terraform init       # Inicializa o projeto
terraform plan       # Mostra o plano de execução
terraform apply      # Aplica a infraestrutura
terraform destroy    # Remove todos os recursos
