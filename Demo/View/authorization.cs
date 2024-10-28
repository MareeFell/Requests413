using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Demo.Classes;
using Demo.Model;

namespace Demo
{
    public partial class authorization : Form
    {
        public authorization()
        {
            InitializeComponent();
            try
            {
                Helper.DB = new Model.demoEntities();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Связь с БД не установлена");
            }
        }

        private void Exit_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void Enter_Click(object sender, EventArgs e)
        {
            // Вход в систему
            string login = textLogin.Text;
            string password = textPassword.Text;
            Helper.user = Helper.DB.Users.Where(u => u.Login == login && u.Password == password).FirstOrDefault();

            if (Helper.user != null)
            {
                MessageBox.Show("Вы вошли с ролью " + Helper.user.Role1.NameRole);
                View.Requests requests = new View.Requests();
                this.Hide();
                requests.ShowDialog();
                this.Show();
            }
            else
            {
                MessageBox.Show("Пользователя не существует");
            }
        }
    }
}
