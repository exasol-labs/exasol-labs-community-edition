# 🚀 Exasol Community Edition 202x.x

**Exasol Community Edition** is a **fully functional, free Exasol 8 database with no feature restrictions**, packaged as a **ready-to-use Virtual Machine image** for **easy installation and evaluation on any desktop or laptop**.

It’s your **One-Stop Solution and Swiss Army Knife** for **self-evaluation, testing, and proof-of-concepts (PoCs)** — supporting **up to 200 GB of raw data on a single node**.  

**Built with passion by our Solution Engineering Team** to **supercharge your innovation, data, and AI projects**, while providing a **hands-on introduction to Exasol’s legendary performance** in a friendly, non-production environment.

---

**[PLEASE READ THIS DISCLAIMER BEFORE USING THE CONTENTS IN THIS REPOSITORY](https://github.com/exasol-labs/exasol-labs-community-edition/blob/main/DISCLAIMER.md)**  /  **[LICENSE](https://github.com/exasol-labs/exasol-labs-community-edition?tab=MIT-1-ov-file)**

---

## 📖 Table of Contents
- [🌟 Get Started Today](#-get-started-today)
- [✨ Key Features – What You Get](#-key-features--what-you-get)
- [⚠️ Limitations](#️-limitations)
- [🛟 Support](#-support)
- [🧰 Requirements and Pre-Requisites](#-requirements-and-pre-requisites)
- [🧩 Installing Exasol Community Edition](#-installing-exasol-community-edition)
  - [🪟 VMware Workstation Pro (Windows)](#-vmware-workstation-pro-windows)
  - [🍏 VMware Fusion (macOS Intel)](#-vmware-fusion-macos-intel)
  - [🪟 VirtualBox (Windows)](#-virtualbox-windows)
  - [🍏 VirtualBox (macOS Intel)](#-virtualbox-macos-intel)
  - [💾 Download Now](#-download-now)

---

## 🌟 Get Started Today

Take your analytics to the next level with the power of our **[Latest Release of the Exasol Analytical Engine](https://www.exasol.com/blog/exasol-8-release-2025-1/)** proudly crafted by our fantastic **Development Team**.

- 🧩 **Install and run Exasol Community Edition in under 5 minutes** — from Virtual Machine startup to your first query or data migration.  
- 🚀 **Effortlessly migrate data from any database and build your next-generation Exasol Analytics Data Warehouse.**  
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
- **DbVisualizer Free** – a world class database client for perfectly orchestrating your Exasol Database
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
- **18 preconfigured Virtual Schemas** connected to demo databases (**IBM DB2, MySQL, Oracle, PostgreSQL, Microsoft SQL Server**) and the **Exasol Public Demo Environment**, ready to query immediately.  
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
We’d also **love to hear from you about your experience with the Community Edition** — actively engage, share your feedback, and connect with other users in our vibrant Exasol Community!


- 🏢 **Exasol Software** – The Exasol database engine inside the Community Edition is the same **enterprise-grade core** used in production environments. However, the **Community Edition OVA package** itself is **not officially supported**.  

- 🚀 **Production Use** – For production workloads and full enterprise support, please contact the **[Exasol Sales Team](https://www.exasol.com/contact-us/)** to upgrade to a production-ready license and database with enterprise-level support and SLA coverage.

---

## 🧰 Requirements and Pre-Requisites

To run the **Exasol Community Edition**, your host system must meet the following minimum requirements and setup conditions.  
These ensure a smooth installation and optimal performance experience.

---

### 💻 Minimum Host Requirements

| Component | Minimum | Recommended | Notes |
|------------|----------|--------------|-------|
| **System Type** | Regular laptop or desktop with (temporary) admin rights |  | Required to download and install software |
| **Host Platform** | x86-64 **Windows**, **macOS (Intel only)**, or **Linux** |  | Exasol is **not yet compatible** with Apple Silicon / ARM (coming soon!) |
| **Processor** | 4 vCPUs / Cores | 8 vCPUs / Cores | Intel or AMD only |
| **Memory (RAM)** | 8 GB | 16 GB or more | More RAM = smoother DB and UI performance |
| **Disk Space** | 50 GB free initially | 350 GB (VM can dynamically grow to this size) | Preferably **SSD** or **NVMe** storage |
| **Hypervisor** | VMware Workstation Pro / Fusion Pro or VirtualBox | VMware recommended | See section below for supported versions |

💡 **Tip:** For improved performance, allocate more VM resources if your host system allows it. The default minimum setup (4 vCPUs, 8 GB RAM) provides a good baseline experience.

---

### 🌐 Network & Connectivity Requirements

For an optimal experience, ensure your **host system has an active internet connection** so that all  **Database Migration Scripts and Templates, External Database Connections, Virtual Schema Adapters and Templates, and Ready-to-Use Virtual Schemas** function properly.

If your environment uses a firewall, please make sure it allows **outgoing network connections** on the ports listed in the official Exasol documentation:  
🔗 [System Network Settings and Required Ports](https://docs.exasol.com/db/latest/administration/on-premise/manage_network/system_network_settings.htm)

---

### ⚙️ Hypervisor Recommendation

The **Exasol Community Edition** is delivered in **two optimized OVA flavors** —  
one specifically tuned for **VMware Workstation Pro / Fusion**, and one for **VirtualBox**.

We **clearly recommend VMware** as the **primary choice**, as it provides the **fastest and most stable virtualization technology**,  
offering roughly **30–40 % higher performance** compared to VirtualBox in typical analytical workloads.

**Licensing and usage details:**
- 🟩 **VMware Workstation Pro / Fusion Pro** — Available **at no cost** for **personal, educational, and commercial use**.  
- 🟦 **VirtualBox** — The **base package** is available **free of charge**, including **commercial use**.  
  Some advanced features in the **VirtualBox Extension Pack** may require a **commercial license** for long-term use in business environments.

Other similar virtualization platforms (e.g. **Proxmox**, **Parallels**, **QEMU**, etc.) *might* work as well, but they have **not been officially tested**, and we **cannot guarantee** that one of the provided `.ova` flavors will be fully compatible with them. 

---

### ⚙️ Recommended Hypervisor Versions

Always use the **latest stable versions** of VMware or VirtualBox to ensure compatibility and performance.  
Exasol Community Edition has been extensively tested and tuned for these hypervisors.

> 🧩 **Note:**  
> Please note that **Exasol does not provide support** for installing or operating third-party hypervisors.  
> For assistance, please contact the respective vendor directly and follow their official installation instructions.  
> **Installation is typically simple, well-documented, and straightforward — usually taking less than 10 minutes.**

---

#### 🪟🐧 For Windows (x86-64) and Linux (x86-64)
**VMware Workstation Pro 25H2**

🔗 [Download VMware Workstation & Fusion](https://www.vmware.com/products/desktop-hypervisor/workstation-and-fusion)  
📘 [VMware Desktop Hypervisor FAQs](https://www.vmware.com/docs/desktop-hypervisor-faqs)  
📗 [VMware Knowledge Base – Article 368734](https://knowledge.broadcom.com/external/article?articleNumber=368734)

> ⚠️ **Important:**  
> - Always **reboot your host** after installing or updating your hypervisor to ensure all components (kernel modules and network drivers) are activated correctly.  
> - VMware Workstation Pro is **free for personal, educational, and commercial use**.

---

#### 🍏 For macOS (Intel x86-64 only)
**VMware Fusion 25H2**

🔗 [Download VMware Workstation & Fusion](https://www.vmware.com/products/desktop-hypervisor/workstation-and-fusion)  
📘 [VMware Desktop Hypervisor FAQs](https://www.vmware.com/docs/desktop-hypervisor-faqs)  
📗 [VMware Knowledge Base – Article 368734](https://knowledge.broadcom.com/external/article?articleNumber=368734)

> ⚠️ **Important:**  
> - Exasol Community Edition currently supports **Intel-based Macs only**.  
> - **Apple Silicon (M1/M2/M3/ARM)** support is coming soon — stay tuned!  
> - Always **reboot your host** after installing or updating your hypervisor to ensure all components (kernel modules and network drivers) are activated correctly.  
> - VMware Fusion is **free for personal, educational, and commercial use**.

---

#### 🪟🍏🐧 For Windows, macOS (Intel x86-64 only), and Linux (x86-64)
**VirtualBox 7.2.4 Platform Package + Extension Pack**

🔗 [Download VirtualBox 7.2.4](https://www.virtualbox.org/wiki/Downloads)  
📘 [VirtualBox User Manual](https://www.virtualbox.org/manual/)

> ⚠️ **Important:**  
> - Install **both** the *Platform Package* **and** the *Extension Pack*, otherwise the VM will not start! The Exasol Community Edition `.ova` flavor for VirtualBox uses the NVMe storage controller feature of the *Extension Pack* for best performance.  
> - Always **reboot your host** after installing or updating your hypervisor to ensure all components (kernel modules and network drivers) are activated correctly.  
> - **VirtualBox** is **free and open-source software**.  
>   Some **Extension Pack features** may require a **commercial license** for long-term enterprise use.

---

### 🧠 Additional Recommendations

- 🛡️ **Exclude VM folder from antivirus scanning:**  
  Ensure the folder (and subfolders) where you installed or imported the Exasol Community Edition VM is **excluded from any real-time antivirus scanning** (e.g. Microsoft Defender).  
  Continuous scanning can degrade performance or corrupt VM files.

- ☁️ **Avoid cloud-synced directories:**  
  Do **not** place or sync your VM folder in cloud backup services like OneDrive, Dropbox, or iCloud.  
  These tools may lock or partially sync large VM files, causing instability or degrade VM performance.

- 🧩 **Architecture limitation:**  
  Exasol Community Edition currently supports **only x86-64 processor architectures** (Intel / AMD).  
  **ARM / Apple Silicon** compatibility is under active development and will be available in a future release.

---

💡 **Summary:**  
Use a **modern x86-64 system** with sufficient CPU, RAM, and SSD/NVMe storage, running the **latest VMware or VirtualBox versions**.  
Both are **free to use**, with **VMware recommended** for its **30–40 % higher performance** and stability.  
Follow best practices (reboot after install, disable live scanning) for a smooth experience with the Exasol Community Edition.

---

## 🧩 Installing Exasol Community Edition

Get started in just a few minutes!  
Each **OVA flavor** is fully preconfigured and ready to run with all recommended settings — no manual tweaking required. Just import, start, and explore Exasol.

---

### 🪟 VMware Workstation Pro (Windows)

1️⃣ **Install or Update to VMware Workstation Pro 25H2**  
   - Download the latest version from the [VMware website](https://www.vmware.com/products/desktop-hypervisor/workstation-and-fusion). 
   - Follow the on-screen instructions. Installation usually takes less than 5 minutes.  
   - 🔁 Reboot your Windows machine after installation to activate all components.

2️⃣ **Download the `Exasol_Community_Edition_v8_202xxx_vmware.ova`**  
   - Get the **VMware Edition (Exasol_Community_Edition_v8_202xxx_vmware.ova)** from the [Exasol Community Edition Download Page](https://www.exasol.com/free-signup-community-edition/).
   - Download size is around 14 GB and should take less than 10 minutes to complete, depending on your internet connection speed.

3️⃣ **Import the OVA file**  
   - Open **VMware Workstation Pro** → *File > Open* or → *Click the icon > Open a Virtual Machine*.  
   - Select the downloaded `.ova` file and click **Import**.
   - The import process usually takes less than 5 minutes to complete. 
   - All optimal settings (CPU, RAM, storage, network) are already preconfigured for you. No manual configuration needed.  

4️⃣ **Start the Virtual Machine**  
   - Select the imported VM and click **Power on this virtual machine**.
   - Please do not change any settings of the VM. You can raise your Processor/Memory settings to 8 vCPUs, 16 GB RAM at a later stage, the default setting of 4 vCPUs, 8 GB RAM is a good starting point.  
   - The VM boots and logs in automatically, performs first-start configuration (IP settings), and starts up the Exasol Database.
   - If you see the green "RUNNING" status in the terminal window, you are ready to go! You can close this window. Reopen it at any time by clicking the "Check DB status" icon on the desktop.
   - The first-start process usually takes less than 2 minutes to complete, all subsequent starts will peform much quicker.
   - Auto-resize your VM screen easily by double-clicking on the top bar of the Virtual Machine Window.
   - Please change your keyboard settings to your preferred keyboard layout by clicking on the *de1* icon in the upper right corner within the Virtual Machine.
   - Login to Ubuntu (if required):  
     - **Username:** `exasol`  
     - **Password:** `exasol`

✅ That’s it! Within minutes, your Exasol Community Edition will be ready to use. Continue with the **Getting Started – Running Queries in Exasol** chapter described below.  
💡 **Tip: If you want to stop the VM and the Exasol Database please always use the icon "Shutdown DB & Server" on the desktop to ensure a graceful stop of all components.**

---

### 🍏 VMware Fusion (macOS Intel)

1️⃣ **Install or Update to VMware Fusion 25H2**  
   - Download the latest version from the [VMware website](https://www.vmware.com/products/desktop-hypervisor/workstation-and-fusion).  
   - Follow the on-screen instructions. Installation usually takes less than 5 minutes.
   - 🔁 Reboot your Mac after installation to activate all components.

2️⃣ **Download the `Exasol_Community_Edition_v8_202xxx_vmware.ova`**  
   - Get the **VMware Edition (Exasol_Community_Edition_v8_202xxx_vmware.ova)** from the [Exasol Community Edition Download Page](https://www.exasol.com/free-signup-community-edition/).
   - Download size is around 14 GB and should take less than 10 minutes to complete, depending on your internet connection speed.

3️⃣ **Import the OVA file**  
   - Launch **VMware Fusion** → *File > Import*.  
   - Select the downloaded `.ova` file by clicking on **Choose File...** and click **Continue**.
   - Choose the Folder where to save the VM (leave it on default settings) and click **Save**. Import of the VM starts automatically.
   - The import process usually takes less than 5 minutes to complete.
   - Click **Finish** to startup the VM for the first time. 
   - All optimal settings (CPU, RAM, storage, network) are already preconfigured for you. No manual configuration needed.
   - Please do not change any settings of the VM. You can raise your Processor/Memory settings to 8 vCPUs, 16 GB RAM at a later stage, the default setting of 4 vCPUs, 8 GB RAM is a good starting point.

4️⃣ **Start the Virtual Machine**  
   - By clicking **Finish** in the previous step, the startup was initiated automatically.
   - The VM boots and logs in automatically, performs first-start configuration (IP settings), and starts up the Exasol Database.
   - If you see the green "RUNNING" status in the terminal window, you are ready to go! You can close this window. Reopen it at any time by clicking the "Check DB status" icon on the desktop.
   - The first-start process usually takes less than 2 minutes to complete, all subsequent starts will peform much quicker.
   - Auto-resize your VM screen easily by double-clicking on the top bar of the Virtual Machine Window.
   - Please change your keyboard settings to your preferred keyboard layout by clicking on the *de1* icon in the upper right corner within the Virtual Machine.
   - Login to Ubuntu (if required):  
     - **Username:** `exasol`  
     - **Password:** `exasol`

✅ That’s it! Within minutes, your Exasol Community Edition will be ready to use. Continue with the **Getting Started – Running Queries in Exasol** chapter described below.  
💡 **Tip: If you want to stop the VM and the Exasol Database please always use the icon "Shutdown DB & Server" on the desktop to ensure a graceful stop of all components.**

---

### 🪟 VirtualBox (Windows)

1️⃣ **Install or Update to VirtualBox 7.2.4 + VirtualBox Extension Pack**  
   - Download both from the [official VirtualBox site](https://www.virtualbox.org/wiki/Downloads).  
   - Install the *Platform Package* **and** the *Extension Pack* (needed for NVMe support).
   - Follow the on-screen instructions. Installation usually takes less than 5 minutes. 
   - 🔁 Reboot your Windows machine after installation to activate all components.

2️⃣ **Download the `Exasol_Community_Edition_v8_202xxx_virtualbox.ova`**  
   - Get the **Virtualbox Edition (Exasol_Community_Edition_v8_202xxx_virtualbox.ova)** from the [Exasol Community Edition Download Page](https://www.exasol.com/free-signup-community-edition/).
   - Download size is around 14 GB and should take less than 10 minutes to complete, depending on your internet connection speed.

3️⃣ **Import the OVA file**  
   - Open **VirtualBox** → *File > Import Appliance...* or → *Click the icon on the home screen > Import*.  
   - Select the downloaded `.ova` file by clicking on the folder icon and click **Finish**.
   - All optimal settings (CPU, RAM, storage, network) are already preconfigured for you. No manual configuration needed.
   - Please do not change any settings of the VM. You can raise your Processor/Memory settings to 8 vCPUs, 16 GB RAM at a later stage, the default setting of 4 vCPUs, 8 GB RAM is a good starting point.
   - The import process usually takes less than 5 minutes to complete.

4️⃣ **Start the Virtual Machine**  
   - Select the imported VM and click **Start**.  
   - The VM boots and logs in automatically, performs first-start configuration (IP settings), and starts up the Exasol Database.
   - If you see the green "RUNNING" status in the terminal window, you are ready to go! You can close this window. Reopen it at any time by clicking the "Check DB status" icon on the desktop.
   - The first-start process usually takes less than 2 minutes to complete, all subsequent starts will peform much quicker.
   - Auto-resize your VM screen easily by double-clicking on the top bar of the Virtual Machine Window.
   - Please change your keyboard settings to your preferred keyboard layout by clicking on the *de1* icon in the upper right corner within the Virtual Machine.
   - Login to Ubuntu (if required):  
     - **Username:** `exasol`  
     - **Password:** `exasol`

✅ That’s it! Within minutes, your Exasol Community Edition will be ready to use. Continue with the **Getting Started – Running Queries in Exasol** chapter described below.  
💡 **Tip: If you want to stop the VM and the Exasol Database please always use the icon "Shutdown DB & Server" on the desktop to ensure a graceful stop of all components.**

---

### 🍏 VirtualBox (macOS Intel)

1️⃣ **Install or Update to VirtualBox 7.2.4 + VirtualBox Extension Pack**  
   - Download both from the [official VirtualBox site](https://www.virtualbox.org/wiki/Downloads).  
   - Install the *Platform Package* **and** the *Extension Pack* (needed for NVMe support).
   - Follow the on-screen instructions. Installation usually takes less than 5 minutes. 
   - 🔁 Reboot your Mac after installation to activate all components.

2️⃣ **Download the `Exasol_Community_Edition_v8_202xxx_virtualbox.ova`**  
   - Get the **Virtualbox Edition (Exasol_Community_Edition_v8_202xxx_virtualbox.ova)** from the [Exasol Community Edition Download Page](https://www.exasol.com/free-signup-community-edition/).
   - Download size is around 14 GB and should take less than 10 minutes to complete, depending on your internet connection speed.

3️⃣ **Import the OVA file**  
   - Open **VirtualBox** → *File > Import Appliance...* or → *Click the icon on the home screen > Import*.  
   - Select the downloaded `.ova` file by clicking on the folder icon and click **Finish**.
   - All optimal settings (CPU, RAM, storage, network) are already preconfigured for you. No manual configuration needed.
   - Please do not change any settings of the VM. You can raise your Processor/Memory settings to 8 vCPUs, 16 GB RAM at a later stage, the default setting of 4 vCPUs, 8 GB RAM is a good starting point.
   - The import process usually takes less than 5 minutes to complete.

4️⃣ **Start the Virtual Machine**  
   - Select the imported VM and click **Start**.  
   - The VM boots and logs in automatically, performs first-start configuration (IP settings), and starts up the Exasol Database.
   - If you see the green "RUNNING" status in the terminal window, you are ready to go! You can close this window. Reopen it at any time by clicking the "Check DB status" icon on the desktop.
   - The first-start process usually takes less than 2 minutes to complete, all subsequent starts will peform much quicker.
   - Auto-resize your VM screen easily by double-clicking on the top bar of the Virtual Machine Window.
   - Please change your keyboard settings to your preferred keyboard layout by clicking on the *de1* icon in the upper right corner within the Virtual Machine.
   - Login to Ubuntu (if required):  
     - **Username:** `exasol`  
     - **Password:** `exasol`

✅ That’s it! Within minutes, your Exasol Community Edition will be ready to use. Continue with the **Getting Started – Running Queries in Exasol** chapter described below.  
💡 **Tip: If you want to stop the VM and the Exasol Database please always use the icon "Shutdown DB & Server" on the desktop to ensure a graceful stop of all components.**

---

## 🧭 Getting Started – Running Queries in Exasol

Once your **Exasol Community Edition** VM is up and running, you can start exploring right away.  All essential services start automatically at first boot.

---

### 1️⃣ Open DbVisualizer

- Double-click the **DbVisualizer** desktop icon.
- Click on the **Databases** tab.
- Expand the **Exasol (Local)** database connection (click > on the left side of the connection name).
- Ensure the connection is successful.

---

### 2️⃣ Run Your First SQL Query

- Click on **SQL Commander** in the Menu Bar and open a **New SQL Commander**
- Select the Database Connection **Exasol (Local)** and copy the following SQL Statement into the window: `SELECT 'Hello, Exasol Community Edition!' AS WELCOME_MESSAGE;`
- Submit the SQL Query by clicking the far left green play button.
- ✅ If you see the message returned, you're all set — your Exasol Community Edition is fully operational. 🎉

---

### 3️⃣ Access the Admin UI

Your Exasol Community Edition includes the modern **Exasol Admin UI** — a built-in web interface for managing your database.

1. Open **Firefox** (preconfigured with Exasol bookmarks).  
2. Click the bookmark **“Exasol Admin UI”** or open the URL in Firefox:

   ```text
   https://<your-vm-ip>:4430


🎉 **Next step:**  
Once your VM is up and running, continue with **“Getting Started – First Login & Query”**  
to connect to the database, open the Admin UI, and run your first SQL query.



### 💾 Download Now

👉 **[Get Exasol Community Edition](https://www.exasol.com/free-signup-community-edition/)**
