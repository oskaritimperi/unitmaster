/**
 * Copyright (c) 2012 Nokia Corporation.
 * All rights reserved.
 *
 * For the applicable distribution terms see the license text file included in
 * the distribution.
 */

#ifndef SETTINGS_H
#define SETTINGS_H

#include <QtCore/QObject>
#include <QtCore/QVariant>


class Settings : public QObject
{
    Q_OBJECT

public:
    explicit Settings(QObject *parent = 0);
    explicit Settings(const Settings &settings);

public slots:
    void setSetting(const QString &setting, const QVariant &value);
    QVariant setting(const QString &setting, const QVariant &defaultValue);
    QVariant setting(const QString &setting);
    bool removeSetting(const QString &setting);
    void clear();

signals:
    void settingChanged(const QString &setting, const QVariant &value);
};

#endif // SETTINGS_H
