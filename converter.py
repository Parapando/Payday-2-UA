import csv
import os


def csv_to_lua(csv_file, lua_file):
    with open(csv_file, 'r', encoding='utf-8') as f:
        reader = csv.reader(f, delimiter=',')

        with open(lua_file, 'w', encoding='utf-8') as lua_f:
            lua_f.write("return {\n")
            for row in reader:
                if row and len(row) > 1:
                    key = row[0].strip().strip('"')
                    value = row[1].strip()

                    value = value.replace('"', "''")

                    value = value.replace('і', 'i').replace('ї', 'ï').replace('є', 'э').replace('ґ', 'ъ')

                    lua_f.write(f'	{key} = "{value}",\n')
            lua_f.write("	}")


def convert_and_move_files(input_directory, output_directory):
    os.makedirs(output_directory, exist_ok=True)

    for filename in os.listdir(input_directory):
        if filename.endswith('.csv'):
            csv_file_path = os.path.join(input_directory, filename)
            lua_file_path = os.path.join(output_directory, filename[:-4] + '.lua')

            csv_to_lua(csv_file_path, lua_file_path)
            print(f'Converted: {csv_file_path} to {lua_file_path}')


input_dir = 'Crowdin/translated'
output_dir = 'Ukrainian Localization/loc/text'

convert_and_move_files(input_dir, output_dir)
