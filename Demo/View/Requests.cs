using Demo.Classes;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Demo.View
{
    public partial class Requests : Form
    {
        List<Model.Application> requests = new List<Model.Application>();
        List<Model.status> statuses = new List<Model.status>();
        public Requests()
        {
            InitializeComponent();
        }

        private void ShowRequest()
        {
            requests = Helper.DB.Application.ToList();
            if (textNumber.Text.Length > 0)
            {
                requests = requests.Where(r => r.ID.ToString().Contains(textNumber.Text)).ToList();
            }
            switch (comboBoxFilter.SelectedItem)
            {
                case "В ожидании":
                    requests = requests.Where(r => r.status.status1 == "В ожидании").ToList();
                    break;
                case "В работе":
                    requests = requests.Where(r => r.status.status1 == "В работе").ToList();
                    break;
                case "Выполнено":
                    requests = requests.Where(r => r.status.status1 == "Выполнено").ToList();
                    break;
            }
            switch (Helper.user.Role1.IDRole)
            {
                case 1:
                    requests = requests.Where(r => r.ID_client == Helper.user.ID).ToList();
                    break;

                case 2:
                    requests = requests.Where(r => r.ID_executor == Helper.user.ID).ToList();
                    break;
            }

            // DGV настроим на отображение
            dataGridViewRequests.Rows.Clear();

            if (requests.Count <= 0)
            {
                MessageBox.Show("По данной фильтрации заявки не найдены");
                textNumber.Text = string.Empty;
                comboBoxFilter.SelectedIndex = 0;
                return;
            }

            
            int i = 0;
            foreach (Model.Application request in requests)
            {
                dataGridViewRequests.Rows.Add();
                dataGridViewRequests.Rows[i].Cells[0].Value = request.ID;
                dataGridViewRequests.Rows[i].Cells[1].Value = request.Date;
                dataGridViewRequests.Rows[i].Cells[2].Value = request.ID_equipment;
                dataGridViewRequests.Rows[i].Cells[3].Value = request.Users.USER;
                dataGridViewRequests.Rows[i].Cells[4].Value = request.status.status1;
                dataGridViewRequests.Rows[i].Cells[5].Value = request.Users.USER;
                dataGridViewRequests.Rows[i].Cells[6].Value = request.stage.stage1;
                i++;
            }

        }

        private void NewOrder_Click(object sender, EventArgs e)
        {

        }

        private void Requests_Shown(object sender, EventArgs e)
        {
            // Отображение кнопок, в зависимости от роли
            Reports.Visible = NewOrder.Visible = EditOrder.Visible = false;
            switch (Helper.user.Role1.IDRole)
            {
                case 2: //Master
                    EditOrder.Visible = true;
                    requests = requests.Where(r => r.ID_executor == Helper.user.ID).ToList();
                    break;
                case 3: // Operator
                    EditOrder.Visible = NewOrder.Visible = true;
                    break;

                case 4: //Manager
                    Reports.Visible = true;
                    break;
            }
                    ShowRequest();
        }

        private void buttonExit_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void comboBoxFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            ShowRequest();
        }

        private void textNumber_TextChanged(object sender, EventArgs e)
        {
            //Ввод номера по поиску
            ShowRequest();
        }

        private void Requests_Load(object sender, EventArgs e)
        {
            //центрирование
            CenterToScreen();
            // заполнение комбобокса
            statuses = Helper.DB.status.ToList();
            comboBoxFilter.Items.Clear();
            foreach (Model.status status in statuses)
            {
                comboBoxFilter.Items.Add(status.status1);
            }
            comboBoxFilter.Items.Insert(0, "Все заявки");
            comboBoxFilter.SelectedIndex = 0;
        }
    }
}
