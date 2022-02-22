# DB Server - Automation Exercise

---

## 🌐 **UI CHALLENGE**

### ⚒️ Tools & Libs

**Programming Language:** Python

**Framework:** Robot Framework

**Automation Tool:** Selenium

**Data Generation:** Faker

**Web Browser:** Chrome v98

<aside>
ℹ️ If your chrome version is different, please download the right version here and put in the drivers directory.

</aside>

### Notes

As it is a project with few test cases, the structure could be much simpler, but I chose to use a structure that can support the project's growth without major changes.

---

## ****👨🏻‍💻 **API CHALLENGE**

### 🛠️ Tools & Libs

**Programming Language:** Python

**Test Framework:** Pytest

---

## ▶️ HOW TO RUN

Go to the project's root directory and:

1. Install dependencies

```bash
$ poetry install
```

1. Running the API Tests

```bash
$ poetry run pytest
```

1. Running UI Tests

```bash
$ poetry run robot -d ui/results ui/tests
```

💡 If you don't use poetry as your package manager, there's a `requirements.txt` file in the project too. Just create a `venv` , activate it, install the dependencies with `pip` and run the commands `pytest` for the API tests and `robot -d ui/results ui/tests` for the UI Tests

---

## Things to Make the Exercise Better

1. Headless execution
2. Containerize the automation
3. Separate the automation project and browser in different containers