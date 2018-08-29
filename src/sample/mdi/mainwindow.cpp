#include "mainwindow.h"
#include "ui_mainwindow.h"

#include "mdi_master.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_pushButton_clicked()
{
    static MdiMaster * oMdiMaster = new MdiMaster();
    oMdiMaster->show();
}
