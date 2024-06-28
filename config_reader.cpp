#include <iostream>
#include <fstream>
#include <string>
#include <map>

using namespace std;

map<string, string> readConfigFile(const string& filename) {
    ifstream configFile(filename);

    if (!configFile) {
        cerr << "Failed to open " << filename << endl;
        return {};
    }

    map<string, string> configData;

    string line;
    while (getline(configFile, line)) {
        size_t delimiterPos = line.find('=');
        if (delimiterPos != string::npos) {
            string key = line.substr(0, delimiterPos);
            string value = line.substr(delimiterPos + 1);

            // Trim whitespace from key and value
            key.erase(0, key.find_first_not_of(" \t"));
            key.erase(key.find_last_not_of(" \t") + 1);
            value.erase(0, value.find_first_not_of(" \t"));
            value.erase(value.find_last_not_of(" \t") + 1);

            // Store key-value pair in the map
            configData[key] = value;
        }
    }

    configFile.close();
    return configData;
}
