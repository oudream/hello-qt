#include "mdi_child.h"
#include "ui_mdi_child.h"

MdiChild::MdiChild(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::MdiChild)
{
    ui->setupUi(this);

    static int sequenceNumber = 1;
    _id = tr("document%1.txt").arg(sequenceNumber++);
    setWindowTitle(_id);
}

MdiChild::~MdiChild()
{
    delete ui;
}
