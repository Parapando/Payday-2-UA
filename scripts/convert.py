import csv
import os
import shutil

def csv_to_lua(csv_file, lua_file):
    with open(csv_file, 'r', encoding='utf-8') as f:
        reader = csv.reader(f, delimiter=';')
        
        with open(lua_file, 'w', encoding='utf-8') as lua_f:
            lua_f.write("return {\n")
            for row in reader:
                if row and len(row) > 1:  # Перевірка, що рядок не порожній і має більше одного елемента
                    key = row[0].strip().strip('"')
                    value = row[1].strip().strip('"')
                    lua_f.write(f'    {key} = "{value}",\n')
            lua_f.write("}\n")

def convert_and_move_files(input_directory, output_directory):
    # Переконайся, що вихідна директорія існує
    os.makedirs(output_directory, exist_ok=True)

    for filename in os.listdir(input_directory):
        if filename.endswith('.csv'):
            csv_file_path = os.path.join(input_directory, filename)
            lua_file_path = os.path.join(input_directory, filename[:-4] + '.lua')  # Зміна розширення на .lua
            
            # Конвертація CSV у Lua
            csv_to_lua(csv_file_path, lua_file_path)
            print(f'Converted: {csv_file_path} to {lua_file_path}')
            
            # Переміщення згенерованого Lua-файлу до вихідної директорії
            shutil.move(lua_file_path, os.path.join(output_directory, filename[:-4] + '.lua'))
            print(f'Moved: {lua_file_path} to {output_directory}')

# Використання
input_dir = '/Crowdin/translated'  # Вказати шлях до папки з CSV
output_dir = '/Ukrainian Localization/loc/text'  # Вказати шлях до папки для Lua файлів

convert_and_move_files(input_dir, output_dir)
