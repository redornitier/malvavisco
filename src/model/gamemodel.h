#ifndef GAMEMODEL_H
#define GAMEMODEL_H

#include <QObject>
#include <QList>
#include <QVariantList>

class GameModel : public QObject
{
    Q_OBJECT
public:
    explicit GameModel(QObject *parent = nullptr);

    QString name() const;

    QString animal() const;

    QString type() const;

    unsigned char difficulty() const;

    unsigned char estimatedTime() const;

    unsigned char minPeople() const;

    unsigned char maxPeople() const;

    QVariantList description() const;

protected:
    QString mName{""};
    QString mAnimal{""};
    QString mType{""};
    unsigned char mDifficulty{0};
    unsigned char mEstimatedTime{0};
    unsigned char mMinPeople{0};
    unsigned char mMaxPeople{0};
    QVariantList mDescription{};

signals:
private:
    Q_PROPERTY(QString name READ name CONSTANT FINAL)
    Q_PROPERTY(QString animal READ animal CONSTANT FINAL)
    Q_PROPERTY(QString type READ type CONSTANT FINAL)
    Q_PROPERTY(unsigned char difficulty READ difficulty CONSTANT FINAL)
    Q_PROPERTY(unsigned char estimatedTime READ estimatedTime CONSTANT FINAL)
    Q_PROPERTY(unsigned char minPeople READ minPeople CONSTANT FINAL)
    Q_PROPERTY(unsigned char maxPeople READ maxPeople CONSTANT FINAL)
    Q_PROPERTY(QVariantList description READ description CONSTANT FINAL)

};

#endif // GAMEMODEL_H
