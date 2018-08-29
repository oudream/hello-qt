#include "mdi_win.h"
#include "ui_mdi_win.h"

MdiWin::MdiWin(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::MdiWin)
{
    ui->setupUi(this);
}

MdiWin::~MdiWin()
{
    delete ui;
}
