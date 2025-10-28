# 🚀 Exasol Community Edition 202x.x

**Exasol Community Edition** is a **fully functional, free-of-charge Exasol 8 database without restrictions on features** - packaged as a Virtual Machine Image for **easy installation and non-productive use on any desktop or laptop**.

It’s your **One-Stop Solution and Swiss Army Knife** for **self-evaluation, testing, and proof-of-concepts** — supporting **up to 200 GB raw data on a single node**.  

**Built for you with passion by our Solution Engineering Team** to **supercharge your innovation, data, and AI projects**, while giving you a **hands-on introduction to Exasol’s legendary high-performance capabilities** in a friendly, non-production environment.

---

**[PLEASE READ THIS DISCLAIMER BEFORE USING THE CONTENTS IN THIS REPOSITORY](https://github.com/exasol-labs/exasol-labs-community-edition/blob/main/DISCLAIMER.md)**  /  **[LICENSE](https://github.com/exasol-labs/exasol-labs-community-edition?tab=MIT-1-ov-file)**

---

## 🌟 Get Started Today

Take your business to the next level with the power of our **[Latest Release of the Exasol Analytical Engine](https://www.exasol.com/blog/exasol-8-release-2025-1/)** proudly developed by our fantastic colleagues in the **Development Team**.

- 🧩 **Install and run Exasol Community Edition in under 5 minutes** — from Virtual Machine startup to your first query or data migration.  
- 🚀 **Effortlessly migrate your data from other databases and build your new Exasol Analytics Data Warehouse.**  
- 📊 **Boost your BI applications by up to 10×!**  
- 🤖 **Extend your setup with our powerful AI tools. Deploy and run your own AI models directly on your data.**
  - [Exasol AI Lab](https://github.com/exasol/ai-lab)
  - [Exasol MCP Server](https://github.com/exasol/mcp-server)
  - [Exasol MCP Server with Text-to-SQL](https://github.com/exasol-labs/exasol-labs-text2sql-mcp-server)

---

## ✨ Key Features – What You Get

**Exasol Community Edition is your all-in-one analytics sandbox** — install, connect, and explore in minutes. Everything you need to **evaluate, learn, and experience Exasol** at full power — right on your desktop, fully automated, and tuned for performance.

---

#### 🚀 Plug & Play Virtual Machine
- Ready-to-run **`.ova` image files** in two optimized editions:  
  1️⃣ **VMware Edition** – tuned for VMware hypervisors  
  2️⃣ **VirtualBox Edition** – tuned for VirtualBox hypervisors  

---

#### ⚡ Simple Setup, Smart Automation
- Super-easy installation and onboarding — from first boot to your first query in just a few clicks  
- Automatic **IP configuration** at first startup  
- **Auto-scaling Exasol DB RAM** when you change your host’s RAM allocation  

---

#### 🧠 Customizable & Flexible
- **Adjust CPU and RAM** freely to match your desktop or laptop’s capabilities  

---

#### 🖥️ Complete Linux Environment
- Based on **Ubuntu Desktop 24.04.3 LTS**, fully updated and performance-tuned  
- Includes convenient **desktop shortcuts** for Exasol DB administration and monitoring  

---

#### 🌐 Everything You Need, Preinstalled
- **Firefox** preconfigured with bookmarks to essential Exasol resources and documentation  
- **DbVisualizer Free** – the world’s best database client for perfectly orchestrating your Exasol DB
- **EXAplus Command Line Client** for executing SQL directly from the terminal
- **Exasol Admin UI** – manage, monitor, and troubleshoot your database with ease

---

#### 🧩 Guided “Get Started” Workflows
- Hands-on **ETL SQL examples and demos** showing Exasol’s speed, simplicity, and analytical power  
- Get familiar with the most important features in just **30 minutes**  

---

#### 🔗 Preinstalled JDBC Drivers & Connectors
- Ready-to-use JDBC drivers and configurations in Exasol **BucketFS** for:  
  **Databricks, IBM DB2, MariaDB, MySQL, Oracle (JDBC & OCI), PostgreSQL, Amazon Redshift, SAP Hana, Snowflake, Microsoft SQL Server (On-Prem and Azure SQL, SQL Server Authentication and Microsoft Entra ID / Azure Active Directory Authentication Mode), Teradata, and Exasol.**

---

#### 🛠️ Database Migration Made Easy

- Preinstalled and ready-to-use **Database Migration Scripts and Templates** for seamless data migration from the most common enterprise databases — all available out of the box.

- Supported source databases:  
**Databricks, IBM DB2, MariaDB, MySQL, Oracle, PostgreSQL, Amazon Redshift, SAP Hana, Snowflake, Microsoft SQL Server (On-Prem and Azure SQL), Teradata, and Exasol.**

- Migrate your data into Exasol in **three simple steps**:  
  1️⃣ **Create your connection object** — just enter your source database credentials and IP/hostname.  
  2️⃣ **Run the migration script** — it automatically generates all relevant table/view DDL and import statements from your source.  
  3️⃣ **Execute the generated SQL statements** — your first data will appear in Exasol within minutes!  

---

#### ⚙️ Post-Load Optimization Script
- Includes the powerful **`CONVERT_DATATYPES`** script for post-load datatype optimization  
- Run it after importing your data to automatically optimize column types for improved performance and reduced storage  

---

#### 🌎 Virtual Schema Adapters & Templates
- Preinstalled and ready-to-use **Virtual Schema Adapters and Templates** for seamless cross-database access.  
- Supported databases:  
**Databricks, IBM DB2, MySQL, Oracle, PostgreSQL, Amazon Redshift, SAP Hana, Snowflake, Microsoft SQL Server, and Exasol.**

- Connect in **three simple steps**:  
  1️⃣ **Create your connection object** — just enter your credentials and database IP/hostname.  
  2️⃣ **Create your Virtual Schema** via SQL with a single statement.  
  3️⃣ **Query your source data** directly from Exasol — no data movement required.  

---

#### 🔢 Ready-to-Use Virtual Schemas
- **18 preconfigured Virtual Schemas** connected to small demo databases (**IBM DB2, MySQL, Oracle, PostgreSQL, Microsoft SQL Server**) and the **Exasol Public Demo Environment**  
- Instantly explore and query versatile demo datasets right inside your Exasol Community Edition (Banking, Flights, NYC Taxi, Prescriptions UK, TPC-H 1-1000GB, TPC-DS 1-1000GB)  

---

## ⚠️ Limitations

While the **Exasol Community Edition** delivers the full Exasol experience, it is designed **exclusively for evaluation, testing, and learning purposes** — not for production use.

- 📊 **200 GB RAW data limit** – Ideal for self-evaluation, PoCs, and small-scale analytics scenarios.  
- 🧪 **Non-production environment** – Intended exclusively for testing, learning, and experimentation.  
- ⚙️ **Shared system resources** – Runs as a virtual machine that shares CPU and memory with other applications on your desktop or laptop. Performance may vary, especially under heavy multitasking or concurrent workloads.  

---

## 🛟 Support

- 🧩 **Community Edition** – Provided *as-is*, without official Exasol support. It’s built for **exploration and non-production use only**.  
  💬 Got questions? Post them in the **[Exasol Community Forum](https://community.exasol.com/tag/community-edition)** using the tag `community-edition`.

- 🏢 **Exasol Software** – The Exasol database engine inside the Community Edition is the same **enterprise-grade core** used in production environments.  
  However, the **Community Edition OVA package** itself is **not officially supported**.  

- 🚀 **Production Use** – For mission-critical workloads and full enterprise support, please contact the **[Exasol Sales Team](https://www.exasol.com/contact-us/)** to upgrade to a production-ready license with enterprise-level support, performance tuning, and SLA coverage.



Recommended Versions of Hypervisors:
We clearly recommend using always the most actual versions of the VMware and VirtualBox Hypervisors on your host system to ensure a flawless and high-performance experience.
Please note that Exasol Community Edition is only running on host systems (Windows, MacOS, Linux) with x86-64 processor architecture (Intel, AMD). ARM/Apple Silicon processors are not yet supported!

For optimal performance please ensure that the folder/subfolder where you have imported/installed the Exasol Community Edition VM is excluded from any real-time virus scanner software like MS Defender etc. (you should do that for all your installed VMs by the way 😉) and is also not continuously synced with a Cloud Service like OneDrive or Dropbox!!!

For Windows (x86-64) and Linux (x86-64):
VMware Workstation Pro/Player 25H2
Download here:
https://www.vmware.com/products/desktop-hypervisor/workstation-and-fusion
Please refer to the vendor’s installation instructions and prerequisites. We strongly recommend to do a reboot of your host system after the installation/update of your hypervisor software to ensure all components working correctly!
https://www.vmware.com/docs/desktop-hypervisor-faqs
https://knowledge.broadcom.com/external/article?articleNumber=368734

For MacOS (Intel x86-64 only):
VMware Fusion 25H2
Download here:
https://www.vmware.com/products/desktop-hypervisor/workstation-and-fusion
Please refer to the vendor’s installation instructions and prerequisites. We strongly recommend to do a reboot of your host system after the installation/update of your hypervisor software to ensure all components working correctly!
https://www.vmware.com/docs/desktop-hypervisor-faqs
https://knowledge.broadcom.com/external/article?articleNumber=368734



For Windows (x86-64), MacOS (Intel x86-64 only) and Linux (x86-64):
VirtualBox 7.2.4 Platform Package + VirtualBox 7.2.4 Extension Pack
Download here:
https://www.virtualbox.org/wiki/Downloads
Please refer to the vendor’s installation instructions and prerequisites.
https://www.virtualbox.org/manual/

We strongly recommend to do a reboot of your host system after the installation/update of your hypervisor software to ensure all components working correctly! For running the Exasol Community Edition VM please install both the Platform Package and the Extension Pack to ensure the most optimal performance.

### 💾 Download Now

👉 **[Get Exasol Community Edition](https://www.exasol.com/free-signup-community-edition/)**
