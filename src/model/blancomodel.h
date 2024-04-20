#ifndef BLANCOMODEL_H
#define BLANCOMODEL_H

#include <QObject>
#include "gamemodel.h"

class BlancoModel : public GameModel
{
    Q_OBJECT
public:
    explicit BlancoModel(GameModel *parent = nullptr);

    void init(QString path);

signals:
};

#endif // BLANCOMODEL_H
