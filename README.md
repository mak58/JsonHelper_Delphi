# TJsonObject JSON Cleaner (Delphi Helper)

A helper method for Delphi's `TJsonObject` that removes specific named key-value pairs from JSON structures — including inside nested arrays and objects — when certain conditions are met.

---

## 📌 Problem

In certain applications, you may receive a JSON structure that contains **named fields** you want to remove conditionally. For example, numeric fields with value `0` might be irrelevant and should be pruned from the final data.

This helper is **not meant to clean all keys blindly**. Instead, it only works when you know **which parent keys or node paths to target**.

---

## ✅ Solution

The solution is implemented as a **helper method for `TJsonObject`**, making it easy to integrate into existing Delphi applications.

Key features:
- Accepts the name of keys to be removed (e.g., `"age"`, `"passport"`)
- Supports nested arrays and objects (e.g., `"document" -> certificate -> birthDocument"`)
- Only removes values **matching a condition**, such as **integers less than 1**
- Uses Delphi’s `Rest.Json` unit for parsing and modification

---

## 🧪 Example Input JSON

```json
{
  "name": "John Doe",
  "age": 0,
  "document": [
    {
      "personID": 1101100100,
      "passport": 0,
      "certificate": [
        {
          "birthDocument": 0,
          "marriageDocument": 14535
        }
      ]
    }
  ]
}
